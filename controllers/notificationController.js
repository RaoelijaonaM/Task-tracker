const nodemailer = require('nodemailer');
exports.sendMailNotif = (req, res, next) => {
  let user = req.body;
  sendMail(user, (err, info) => {
    if (err) {
      console.log(err);
      res.status(400);
      res.send({ error: 'Failed' });
    } else {
      console.log('mail send');
      res.send(info);
    }
  });
};
const sendMail = (user, callback) => {
  const transporter = nodemailer.createTransport({
    host: 'smtp.gmail.com',
    port: 587,
    secure:false,
    auth: {
      user: 'mitiaraoelijaona1@gmail.com',
      pass: 'xlcmfmicmqkbalkt',
    },
  });
  const mailOptions = {
    from: `"<Administration>", "<admin@lartic.com>"`,
    to: `<${user.email}>`,
    subject: 'Delai dépassé',
    html: '<h1>Vous avez dépassé de 1 semaine</h1>',
  };
  transporter.sendMail(mailOptions, callback);
};
