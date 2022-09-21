const express = require('express');
const app = express();
const port = process.env.PORT || 3000;
const routes = require('./routes/task');
const taskD = require('./routes/taskD');
const userRoute = require('./routes/user');
const spaceRoute = require('./routes/espace');
const discussionRoute = require('./routes/discussion');
const theseRoute = require('./routes/these');
const webpush = require('web-push');
const cors = require('cors');
const errorHandler = require('./services/errorHandler');

app.use(express.json());
app.use(
  express.urlencoded({
    extended: true,
  })
);
app.use(
  cors({
    origin: '*',
  })
);

const vapidKeys = {
  publicKey:
    'BFVhWDd8rh153pGzuA3pl6UcqHxn4k9AHHZteWu2SnpHIYI119SraqALVJJrGzaM1d_ceiP5dLqAzmNPV-RkeSg',
  privateKey: 'dOosfGqFLa5OQUQT0ssI5BY9MqKvvYzlvswQMbT9Uu4',
};

webpush.setVapidDetails(
  'mailto:mitiaraoelijaona1@gmail.com',
  vapidKeys.publicKey,
  vapidKeys.privateKey
);

app.route('/api/newsletter').post(sendNewsletter);
app.route('/api/notifications').post(addPushSubscriber);
app.route('/api/fichier').post(upload)
function upload(req,res){
  console.log("fichier: ",req.body);
  return;
}
let USER_SUBSCRIPTIONS = [];
function addPushSubscriber(req, res) {
  console.log('mipublish ve?');
  // res.status(200).json({ message: 'Subscription added successfully.' });
  console.log('sub');
  const sub = req.body;
  console.log('sub', sub);

  console.log('Received Subscription on the server: ', sub);

  USER_SUBSCRIPTIONS.push(sub);

  res.status(200).json({ message: 'Subscription added successfully.' });
}
function sendNewsletter(req, res) {
  console.log('sendNewsletter');
 
  const notificationPayload = {
    notification: {
      title: 'Angular News',
      body: 'Newsletter Available!',
      vibrate: [100, 50, 100],
      data: {
        dateOfArrival: Date.now(),
        primaryKey: 1,
      },
      actions: [
        {
          action: 'explore',
          title: 'Go to the site',
        },
      ],
    },
  };

  Promise.all(
    USER_SUBSCRIPTIONS.map((sub) =>
      webpush.sendNotification(sub, JSON.stringify(notificationPayload))
    )
  )
    .then(() =>
      res.status(200).json({ message: 'Newsletter sent successfully.' })
    )
    .catch((err) => {
      console.error('Error sending notification, reason: ', err);
      res.sendStatus(500);
    });
}

app.use('/api', routes);
app.use('/api', taskD);
app.use('/api', userRoute);
app.use('/api', spaceRoute);
app.use('/api', discussionRoute);
app.use('/api', theseRoute);

app.use(errorHandler);
app.get('/', (req, res) => {
  res.json({ message: 'ok' });
});
app.listen(port, () => {
  console.log(`Task-tracking app listening at http://localhost:${port}`);
});
