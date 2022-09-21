const dbConnection = require('../services/db');
const AppError = require('../services/appError');
const controller = require('../controllers/taskDefaultController');
const fichierStatus = require('../services/dossier');
exports.insertFile = (req, res, next) => {
  if (!req.body) {
    return next(new AppError('No data found', 404));
  }
  console.log(req.body);
  const { ID_TACHE, LINK, TITRE } = req.body;
  dbConnection.query(
    'INSERT INTO FICHIER (ID_TACHE, LINK, TITRE) VALUES (?,?,?)',
    [ID_TACHE, LINK, TITRE],
    function (err, data, fields) {
      console.log(this.sql);
      if (err) return next(err);
      res.status(200).json({
        status: 'success',
        data: 'task inserted',
      });
    }
  );
};

exports.getAllFileByTask = (req, res, next) => {
  const id_tache = req.params.tache;
  dbConnection.query(
    'SELECT * FROM Fichier WHERE ID_TACHE = ?',
    id_tache,
    function (err, data, fields) {
      if (err) return next(err);
      // if (!data.length) return next(new AppError('Espace non existante', 404));
      res.status(200).json({
        status: 'success',
        length: data?.length,
        data: data,
      });
    }
  );
};

exports.getAllDossier = (req, res, next) => {
  dbConnection.query(
    "SELECT d.ID_UTILISATEUR,CONCAT(NOM,' ',PRENOM) AS ETUDIANT,DOSSIER FROM DOSSIERETUDIANT d JOIN UTILISATEUR u ON d.ID_UTILISATEUR=u.ID_UTILISATEUR ",
    function (err, data, fields) {
      if (err) return next(err);
      res.status(200).json({
        status: 'success',
        length: data?.length,
        data: data,
      });
    }
  );
};
exports.getDossierById = (req, res, next) => {
  const id_user = req.params.etudiant;

  dbConnection.query(
    "SELECT d.ID_UTILISATEUR,CONCAT(NOM,' ',PRENOM) AS ETUDIANT,DOSSIER FROM DOSSIERETUDIANT d JOIN UTILISATEUR u ON d.ID_UTILISATEUR=u.ID_UTILISATEUR WHERE d.ID_UTILISATEUR=? ",
    id_user,
    function (err, data, fields) {
      if (err) return next(err);
      res.status(200).json({
        status: 'success',
        length: data?.length,
        data: data,
      });
    }
  );
};
exports.updateDossierEtudiant = (req, res, next) => {
  const { id_user, dossier } = req.body;
  const status = fichierStatus.updateStatusDossier(dossier);
  dbConnection.query(
    'UPDATE DOSSIERETUDIANT SET DOSSIER=?, STATUS=? WHERE ID_UTILISATEUR=? ',
    [dossier, status, id_user],
    function (err, data, fields) {
      if (err) return next(err);
      res.status(200).json({
        status: 'success',
        length: data?.length,
        data: 'dossier modifié',
      });
    }
  );
};
