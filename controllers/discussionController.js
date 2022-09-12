const dbConnection = require('../services/db');
const AppError = require('../services/appError');

exports.insertMessage = (req, res, next) => {
    console.log(req.body)
  const { ID_ESPACE, DATE_DISCUSSION, MESSAGE, NOM, ROLE } = req.body;
  dbConnection.query(
    'INSERT INTO DISCUSSION (ID_ESPACE, DATE_DISCUSSION, MESSAGE, NOM, ROLE) VALUES (?,?,?,?,?)',
    [ID_ESPACE, DATE_DISCUSSION, MESSAGE, NOM, ROLE],
    function (err, data, fields) {
      console.log(this.sql);
      if (err) return next(err);
      res.status(200).json({
        status: 'success',
        data: 'message inserted',
      });
    }
  );
};
exports.getMessagesBySpace = (req, res, next) => {
  const id_space = req.params.espace;
  dbConnection.query(
    'SELECT * FROM discussion WHERE id_espace = ?',
    id_space,
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
