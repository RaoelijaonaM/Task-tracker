const express = require('express');
const app = express();
const http = require('http').createServer(app);
const port = process.env.PORT || 3000;
const socketPort = process.env.PORT || 5000;
const routes = require('./routes/task');
const taskD = require('./routes/taskD');
const userRoute = require('./routes/user');
const spaceRoute = require('./routes/espace');
const cors = require('cors');
const errorHandler = require('./services/errorHandler');
const User = require('./model/user');
const io = require('socket.io')(http, {
  cors: {
    origin: '*',
  },
});
let userConnected=new Array();
io.on('connection', (socket) => {
  console.log('connected to socket');
  let newUser = new User(
    socket.handshake.query.id_user,
    socket.handshake.query.nom
  );
  addUserConnected(newUser);
  socket.broadcast.emit('user-connected',[...userConnected])
  socket.emit('user-connected', [...userConnected]);
});

function addUserConnected(u) {
  if (userConnected) {
    let userExist = userConnected.find(
      (element) => element.id_user == u.id_user
    );
    if (!userExist) {
      userConnected.push(u);
    }
  } else {
    userConnected = new Array();
    userConnected.push(u);
  }
}

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
app.use('/api', routes);
app.use('/api', taskD);
app.use('/api', userRoute);
app.use('/api', spaceRoute);

app.use(errorHandler);
app.get('/', (req, res) => {
  res.json({ message: 'ok' });
});
app.listen(port, () => {
  console.log(`Task-tracking app listening at http://localhost:${port}`);
});
http.listen(socketPort, () => {});
