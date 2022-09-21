const dbConnection = require('../services/db');
const AppError = require('../services/appError');

exports.getSoutenanceWeekDate = (req, res, next) => {
const day_begin=req.params.day;
  dbConnection.query('SELECT * FROM ALARMESOUTENANCE WHERE DATE_SOUTENANCE BETWEEN  STR_TO_DATE(?,\'%Y-%m-%d\') AND STR_TO_DATE(?,\'%Y-%m-%d\') + INTERVAL 7  DAY',[day_begin,day_begin],function (err, data, fields) {
    console.log(this.sql)
    if (err) return next(err);
    res.status(200).json({
      status: 'success',
      length: data?.length,
      data: data,
    });
  });
};

exports.getProfTimesSoutenance = (req, res, next) => {
    const annee = req.params.annee
    dbConnection.query(
      'SELECT * FROM foisIdUser WHERE ANNEE = ?',
      annee,
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