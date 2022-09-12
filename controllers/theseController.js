const dbConnection = require('../services/db');
const AppError = require('../services/appError');

exports.insertThese = (req, res, next) => {
  //insert utilisateur
  console.log(req.body);
  const { nom, prenom, mail, numero, theme } = req.body;
  const id_role = 'R1';
  const login = prenom;
  const mdp = prenom;
  dbConnection.query(
    'INSERT INTO UTILISATEUR (ID_ROLE,NOM, PRENOM, MAIL, NUMERO,LOGIN,MDP) VALUES (?,?,?,?,?,?,?)',
    [id_role, nom, prenom, mail, numero, login, mdp],
    function (err, data, fields) {
      console.log(this.sql);
      if (err) {
        dbConnection.rollback(() => {
          console.log('failed1');
        });
        return next(err);
      }
      dbConnection.query(
        'INSERT INTO THESE (ID_UTILISATEUR,THEME) SELECT CONCAT(\'User\',MAX(CAST(SUBSTRING(ID_UTILISATEUR FROM 5) AS UNSIGNED))),? FROM UTILISATEUR',
        theme,
        function (err, data, fields) {
          console.log(this.sql);
          if (err) {
            dbConnection.rollback(() => {
              console.log('failed2');
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

  //   dbConnection.query(
  //     'INSERT INTO UTILISATEUR (ID_ROLE,NOM, PRENOM, MAIL, NUMERO,LOGIN,MDP) VALUES (?,?,?,?,?,?,?)',
  //     [id_role, nom, prenom, mail, numero, login, mdp],
  //     function (err, data, fields) {
  //       console.log(this.sql);
  //       if (err) return next(err);
  //       res.status(200).json({
  //         status: 'success',
  //         data: 'message inserted',
  //       });
  //     }
  //   );
  //   //insert these
  //   insertTheseAfterUser(theme);
  // };
  // function insertTheseAfterUser(theme) {
  //   dbConnection.query(
  //     "INSERT INTO THESE (ID_UTILISATEUR,THEME) VALUES (CONCAT('USER',LAST_INSERT_ID()),?)",
  //     theme,
  //     function (err, data, fields) {
  //       console.log(this.sql);
  //       if (err) console.log(err);
  //       console.log('all inserted complete');
  //     }
  //   );
};
