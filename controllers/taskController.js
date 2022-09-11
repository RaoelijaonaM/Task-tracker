const dbConnection = require('../services/db');
const AppError = require('../services/appError');

exports.getAllTasksBySpace = (req, res, next) => {
  if (typeof req.params.espace == 'undefined') {
    return next(new AppError('espace non spécifiée', 404));
  }
  const id_space = req.params.espace;
  dbConnection.query(
    'SELECT * FROM detailTache WHERE id_espace = ?',
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
exports.getTaskById = (req, res, next) => {
  if (typeof req.params.tache == 'undefined') {
    return next(new AppError('tache non spécifiée', 404));
  }
  const id_tache = req.params.tache;
  dbConnection.query(
    'SELECT * FROM detailtache  WHERE ID_TACHE = ?',
    id_tache,
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
  console.log(req.body);
  if (!req.body) {
    return next(new AppError('No data found', 404));
  }
  const id_tache = req.params.tache;
  const { DATE_FIN, DATE_DEBUT, DESCRIPTION, ID_REPETITION, ID_ALARME,STATUS } =
    req.body;
  if (DATE_FIN < DATE_DEBUT) {
    return next(new AppError('Date fin inférieure date début', 500));
  }
  if(STATUS == 1){
    return next(new AppError('Tâche fini: tâche non modifiable'))
  }
  dbConnection.query(
    'UPDATE TACHE SET DATE_FIN=?, DATE_DEBUT=?, DESCRIPTION=?, ID_REPETITION=?, ID_ALARME=? WHERE id_tache=?',
    [DATE_FIN, DATE_DEBUT, DESCRIPTION, ID_REPETITION, ID_ALARME, id_tache],
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

exports.updateTaskStatus = (req, res, next) => {
  console.log('task update loading....');
  if (!req.body) {
    return next(new AppError('No data found', 404));
  }
  const id_tache = req.params.tache;
  const status = req.body.STATUS;
  dbConnection.query(
    'UPDATE TACHE SET status=? WHERE id_tache=?',
    [status, id_tache],
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
