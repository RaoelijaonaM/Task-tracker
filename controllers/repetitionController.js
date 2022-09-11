const dbConnection = require('../services/db');
const AppError = require('../services/appError');

exports.getAllRepetion = (req, res, next) => {
  dbConnection.query('SELECT * FROM REPETITION', function (err, data, fields) {
    if (err) return next(err);
    res.status(200).json({
      status: 'success',
      length: data?.length,
      data: data,
    });
  });
};
exports.getAllAlarms = (req, res, next) => {
  dbConnection.query('SELECT * FROM ALARME', function (err, data, fields) {
    if (err) return next(err);
    res.status(200).json({
      status: 'success',
      length: data?.length,
      data: data,
    });
  });
};
