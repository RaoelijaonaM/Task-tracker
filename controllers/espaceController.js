const dbConnection = require('../services/db');
const AppError = require('../services/appError');

exports.getSpaceDetails = (req,res,next)=>{
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
} 