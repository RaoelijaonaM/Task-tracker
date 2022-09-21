const dbConnection = require('../services/db');
const AppError = require('../services/appError');
const fichierStatus = require('../services/dossier');

exports.insertThese = (req, res, next) => {
  //insert utilisateur
  console.log(req.body);
  const { nom, prenom, mail, numero, theme, tokendevice, dossier } = req.body;
  const id_role = 'R1';
  const login = prenom;
  const mdp = prenom;
  const status = fichierStatus.updateStatusDossier(dossier);

  dbConnection.query(
    'INSERT INTO UTILISATEUR (ID_ROLE,NOM, PRENOM, MAIL, NUMERO,LOGIN,MDP,TOKENDEVICE) VALUES (?,?,?,?,?,?,?,?)',
    [id_role, nom, prenom, mail, numero, login, mdp, tokendevice],
    function (err, data, fields) {
      console.log(this.sql);
      if (err) {
        dbConnection.rollback(() => {
          console.log('failed1');
        });
        return next(err);
      }
      dbConnection.query(
        "INSERT INTO THESE (ID_UTILISATEUR,THEME) SELECT CONCAT('User',MAX(CAST(SUBSTRING(ID_UTILISATEUR FROM 5) AS UNSIGNED))),? FROM UTILISATEUR",
        theme,
        function (err, data, fields) {
          console.log(this.sql);
          if (err) {
            dbConnection.rollback(() => {
              console.log('failed2');
            });
            return next(err);
          }
          dbConnection.query(
            "INSERT INTO DOSSIERETUDIANT (ID_UTILISATEUR,DOSSIER,STATUS) SELECT CONCAT('User',MAX(CAST(SUBSTRING(ID_UTILISATEUR FROM 5) AS UNSIGNED))),?,? FROM UTILISATEUR",
            [dossier, status],
            function (err, data, fields) {
              console.log(this.sql);
              if (err) {
                dbConnection.rollback(() => {
                  console.log('failed3');
                });
                return next(err);
              }
              dbConnection.commit((err) => {
                console.log(err);
              });
              res.status(200).json({
                status: 'success',
                data: 'success',
              });
            }
          );
        }
      );
    }
  );
};
