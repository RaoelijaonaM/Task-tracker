const dbConnection = require('../services/db');
const AppError = require('../services/appError');
var FCM = require('fcm-node');
exports.getTasksOfLastSpace = (req, res, next) => {
  let idespace=req.params.espace;
  dbConnection.query(
    "SELECT ID_TACHE,ID_ESPACE,ID_ALARME,TacheDefaut.LIBELLE AS ID_TACHED,DATE_DEBUT,DATE_FIN,STATUS,DESCRIPTION FROM Tache JOIN TacheDefaut ON Tache.ID_TACHED=TacheDefaut.ID_TACHED WHERE id_espace = ? AND STATUS=0",id  espace,
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
  const { DATE_FIN, DATE_DEBUT, DESCRIPTION, ID_ALARME, STATUS } = req.body;

  if (DATE_FIN < DATE_DEBUT) {
    return next(new AppError('Date fin inférieure date début', 500));
  }
  if (STATUS == 1) {
    return next(new AppError('Tâche fini: tâche non modifiable'));
  }
  console.log('date fin', DATE_FIN);
  let datedeb = DATE_DEBUT.toLocaleString('en-US');
  let datefin = DATE_FIN.toLocaleString('en-US');
  console.log('date fin2', datefin);

  dbConnection.query(
    'UPDATE TACHE SET DATE_FIN=?, DATE_DEBUT=?, DESCRIPTION=?, ID_ALARME=? WHERE id_tache=?',
    [datefin, datedeb, DESCRIPTION, ID_REPETITION, ID_ALARME, id_tache],
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
exports.getTasksAlert = (req, res, next) => {
  const user = req.params.nom;
  dbConnection.query(
    'SELECT * FROM ALARMETACHE WHERE personne = ?',
    [user],
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
exports.sendNotif = (req, res, next) => {
  var serverKey =
    // 'AAAABo4lx_U:APA91bHdIhClqT0EelkZG86M_-Jf8os3fzFsD5JPvou2JPbMjXmta8hGWD2W3vfTkP3xOIaFRBUb2LL4ccbQgNfOMC3GK1efemb2-ZAcFGJcMd8OirNgaAPytbgbipa9XPEFCLLsiNCW'; //put your server key here
    'AAAALldvfGA:APA91bHoIJo6nz23B_2cgkbs6hg qazHZCBPdRvKWJlXPIp70-D21PDBaWsajhL8VocuhvVgljkCYUJBUf9WbCFcgqnYJNuQ5mdiYmtFMaHfruiUbHxgmZOAv7VjCecTOEucsc-AgCJQT';
  var fcm = new FCM(serverKey);

  var message = {
    //this may vary according to the message type (single recipient, multicast, topic, et cetera)
    to: 'deKBKckqTnuB3UGXitqaHp:APA91bH7R8q0ejOTsf5POEJm3CAC9jjtk_Z85CvP58fxMaLrO5wyR1k89EEtaSK64J5UzlldiTinPUgXAEDm_h0B5IecsA2ZPyIh1wUbU_31ASZfue-zr8wd1VbNkMJfiTXzP0WHu4lz',
    collapse_key: 'your_collapse_key',

    notification: {
      body: 'Body of your push notification',
      priority: 'high',
      subtitle: 'Elementary School',
      title: 'TITLE_notif',
      sound: 'default',
    },

    data: {
      //you can send only notification or only data(or include both)
      my_key: 'my value',
      my_another_key: 'my another value',
    },
  };

  fcm.send(message, function (err, response) {
    if (err) {
      console.log('Something has gone wrong!');
      return next(err);
    } else {
      console.log('Successfully sent with response: ', response);
      res.status(200).json({
        status: 'success',
        data: 'notified',
      });
    }
  });
};
