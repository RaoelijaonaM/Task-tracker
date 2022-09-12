const express = require('express');
const app = express();
const port = process.env.PORT || 3000;
const routes = require('./routes/task');
const taskD = require('./routes/taskD');
const userRoute = require('./routes/user');
const spaceRoute = require('./routes/espace');
const discussionRoute = require('./routes/discussion');

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
app.use('/api', routes);
app.use('/api', taskD);
app.use('/api', userRoute);
app.use('/api', spaceRoute);
app.use('/api', discussionRoute);


app.use(errorHandler);
app.get('/', (req, res) => {
  res.json({ message: 'ok' });
});
app.listen(port, () => {
  console.log(`Task-tracking app listening at http://localhost:${port}`);
});
