const dbConnection = require('../services/db');
const AppError = require('../services/appError');

exports.getSoutenanceWeekDate = (req, res, next) => {
let day_begin= new Date();
let day_end = new Date();
day_end.setDate(day_end.getDate()+10);
  dbConnection.query('SELECT DATE(DATE_SOUTENANCE) as date,ID_UTILISATEUR as nom, THEME as theme FROM ALARMESOUTENANCE WHERE DATE_SOUTENANCE BETWEEN  STR_TO_DATE(?,\'%Y-%m-%d\') AND STR_TO_DATE(?,\'%Y-%m-%d\') AND ROLE=\'Etudiant\'',[day_begin,day_end],function (err, data, fields) {
    console.log(this.sql)
    if (err) return next(err);
    console.log("data: ",data);
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