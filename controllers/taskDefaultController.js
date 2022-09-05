const dbConnection = require('../services/db');
exports.getAllDefaultTask = (req, res, next) => {
  dbConnection.query('SELECT * FROM TACHEDEFAUT', function (err, data, fields) {
    if (err) return next(err);
    res.status(200).json({
      status: 'success',
      length: data?.length,
      data: data,
    });
  });
};
