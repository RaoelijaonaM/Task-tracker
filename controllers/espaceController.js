const dbConnection = require('../services/db');
const AppError = require('../services/appError');
const { db } = require('../config');
const constante = require('../services/constant');
exports.getSpaceDetails = (req, res, next) => {
  const id_space = req.params.espace;
  dbConnection.query(
    'SELECT * FROM detailEspace WHERE id_espace = ?',
    id_space,
    function (err, data, fields) {
      if (err) return next(err);
      if (!data.length) return next(new AppError('Espace non existante', 404));
      res.status(200).json({
        status: 'success',
        length: data?.length,
        data: data,
      });
    }
  );
};

exports.getSpaceMembers = (req, res, next) => {
  const id_space = req.params.espace;
  dbConnection.query(
    'SELECT * FROM membreEspace WHERE id_espace = ?',
    id_space,
    function (err, data, fields) {
      if (err) return next(err);
      if (!data.length) return next(new AppError('Espace non existante', 404));
      res.status(200).json({
        status: 'success',
        length: data?.length,
        data: data,
      });
    }
  );
};

exports.getMySpace = (req, res, next) => {
  const id_user = req.params.user;
  dbConnection.query(
    'SELECT ID_ESPACE FROM ESPACE JOIN THESE ON ESPACE.ID_THESE=THESE.ID_THESE WHERE ID_UTILISATEUR = ?',
    id_user,
    function (err, data, fields) {
      console.log(this.sql);
      if (err) return next(err);
      if (!data.length) return next(new AppError('Espace non existante', 404));
      res.status(200).json({
        status: 'success',
        length: data?.length,
        data: data,
      });
    }
  );
};

exports.getAllSpaces = (req, res, next) => {
  dbConnection.query('SELECT * FROM ADMINESPACE', function (err, data, fields) {
    console.log(this.sql);
    if (err) return next(err);
    if (!data.length) return next(new AppError('Espace non existante', 404));
    res.status(200).json({
      status: 'success',
      length: data?.length,
      data: data,
    });
  });
};
exports.getTheseWithoutSpace = (req, res, next) => {
  dbConnection.query(
    'SELECT * FROM TheseDossier WHERE ID_THESE NOT IN (SELECT ID_THESE FROM ESPACE) AND STATUS=1 ',
    function (err, data, fields) {
      console.log(this.sql);
      if (err) return next(err);
      res.status(200).json({
        status: 'success',
        length: data?.length,
        data: data,
      });
    }
  );
};

/*********************CREATION ESPACE***************************/
//function create espace
exports.creerEspace = (req, res, next) => {
  //insert these
  const { id_these, membres, taches } = req.body;
  dbConnection.query(
    'INSERT INTO ESPACE(ID_THESE,ETAT) VALUES (?,?)',
    [id_these, constante.etatCree],
    function (err, data, fields) {
      console.log(this.sql);
      if (err) {
        dbConnection.rollback(() => {
          console.log('failed1');
        });
        return next(err);
      }
      //insert membre
      const membre = insertMembre(membres);
      if (membre == 1) {
        //insert tache
        const tache = insertTache(taches);
        if (tache == 0) {
          console.log('misy erreur tache');
          dbConnection.rollback(() => {
            console.log('failed3');
          });
          return next('tache problemes');
        }
      } else {
        console.log('misy erreur membre');

        dbConnection.rollback(() => {
          console.log('failed2');
        });
        return next('Membre problemes');
      }
      dbConnection.commit((err) => {
        console.log(err);
      });
      res.status(200).json({
        status: 'success',
        length: data?.length,
        data: data,
      });
    }
  );
};
//insert membre
function insertMembre(membres) {
  try {
    JSON.parse(membres).forEach((element) => {
      dbConnection.query(
        "INSERT INTO MEMBRE (ID_ESPACE,ID_UTILISATEUR,ROLE) SELECT CONCAT('ES',MAX(CAST(SUBSTRING(ID_ESPACE FROM 3) AS UNSIGNED))),?,? FROM ESPACE",
        [element.ID_UTILISATEUR, element.ROLE],
        function (err, data, fields) {
          console.log(this.sql);
          if (err) {
            console.log(err);

            return 0;
          }
        }
      );
    });
    return 1;
  } catch (error) {
    return 0;
  }
}
//insert tache
function insertTache(taches) {
  try {
    JSON.parse(taches).forEach((element) => {
      dbConnection.query(
        "INSERT INTO TACHE (ID_ESPACE,ID_TACHED,ID_ALARME,DATE_DEBUT,DATE_FIN,STATUS) SELECT CONCAT('ES',MAX(CAST(SUBSTRING(ID_ESPACE FROM 3) AS UNSIGNED))),?,?,?,?,? FROM ESPACE",
        [
          element.ID_TACHED,
          element.ID_ALARME,
          element.DATE_DEBUT,
          element.DATE_FIN,
          constante.statusToDo,
        ],
        function (err, data, fields) {
          console.log(this.sql);
          if (err) return 0;
        }
      );
    });
    // return 1;
  } catch (error) {
    return 0;
  }
}
//insert executeur
exports.insertExecuteur = (req, res, next) => {
  console.log('exec: ', req.body);
  req.body.forEach((element) => {
    dbConnection.query(
      'INSERT INTO EXECUTEUR (ID_UTILISATEUR,ID_TACHE,PRIORITE) VALUES (?,?,?)',
      [element.ID_UTILISATEUR, element.ID_TACHE, element.PRIORITE],
      function (err, data, fields) {
        console.log(this.sql);
        if (err) {
          return next(err);
        }
      }
    );
  });
  res.status(200).json({
    status: 'success',
    length: data?.length,
    data: data,
  });
};
