const dbConnection = require('../services/db');
const AppError = require('../services/appError');

exports.getAllTasksBySpace = (req, res, next) => {
  if (typeof req.body.id_espace == 'undefined') {
    return next(new AppError('espace non spécifiée', 404));
  }
  const id_space = req.body.id_espace;
  dbConnection.query(
    'SELECT * FROM tache WHERE id_espace = ?',
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

exports.createTasks = (req, res, next) => {
  if (!req.body) {
    return next(new AppError('No data found', 404));
  }
  console.log(req.body);
  const { id_tacheD, id_utilisateur, id_espace, date_fin, date_debut, status } =
    req.body;
  dbConnection.query(
    'INSERT INTO TACHE (id_tacheD, id_utilisateur, id_espace, date_fin, date_debut, status) VALUES (?,?,?,?,?,?)',
    [id_tacheD, id_utilisateur, id_espace, date_fin, date_debut, status],
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

exports.updateTask = (req, res, next) => {
  if (!req.body) {
    return next(new AppError('No data found', 404));
  }
  const id_tache = req.params.tache;
  const { id_tacheD, id_utilisateur, id_espace, date_fin, date_debut, status } =
    req.body;
  dbConnection.query(
    'UPDATE TACHE SET id_tacheD=?, id_utilisateur=?, id_espace=?, date_fin=?, date_debut=?, status=? WHERE id_tache=?',
    [
      id_tacheD,
      id_utilisateur,
      id_espace,
      date_fin,
      date_debut,
      status,
      id_tache,
    ],
    function (err, data, fields) {
      console.log(this.sql);
      if (err) return next(err);
      res.status(200).json({
        status: 'success',
        data: 'task modified',
      });
    }
  );
};
