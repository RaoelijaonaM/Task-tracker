const dbConnection = require('../services/db');
const AppError = require('../services/appError');
const jwt = require('jsonwebtoken');
require('dotenv').config();

exports.login = (req, res, next) => {
  if (!req.body) {
    return next(new AppError('login et mot de passe obligatoire', 400));
  }
  const { login, password } = req.body;
  dbConnection.query(
    'SELECT * FROM UTILISATEUR WHERE LOGIN = ? AND MDP = ?',
    [login, password],
    function (err, data, fields) {
      if (err) return next(err);
      if (!data.length)
        return next(
          new AppError('Veuillez vérifier votre login/mot de passe', 500)
        );
      const token = jwt.sign({ data }, process.env.JWT_SECRET_KEY, {
        expiresIn: '2h',
      });
      res.status(200).json({
        status: 'success',
        length: data?.length,
        data: token,
      });
    }
  );
};

exports.saveTokenDevice = (req, res, next) => {
  if (!req.body) {
    return next(new AppError('token inexistant', 400));
  }
  const { iduser, token } = req.body;
  console.log(req.body);
  dbConnection.query(
    'UPDATE UTILISATEUR SET TOKENDEVICE= ? WHERE ID_UTILISATEUR = ?',
    [token, iduser],
    function (err, data, fields) {
      console.log(this.sql);
      if (err) return next(err);
      res.status(200).json({
        status: 'success',
        length: data?.length,
        data: { message: 'user updated' },
      });
    }
  );
};

exports.getUsers = (req, res, next) => {
  dbConnection.query('SELECT * FROM UTILISATEUR', function (err, data, fields) {
    console.log(this.sql);
    if (err) return next(err);
    res.status(200).json({
      status: 'success',
      length: data?.length,
      data: data,
    });
  });
};
