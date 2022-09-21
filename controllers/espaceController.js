const dbConnection = require('../services/db');
const AppError = require('../services/appError');

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
