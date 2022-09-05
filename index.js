const express = require('express');
const app = express();
const port = process.env.PORT || 3000;
const routes = require('./routes/task');
const taskD = require('./routes/taskD');

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

app.use(errorHandler);
app.get('/', (req, res) => {
  res.json({ message: 'ok' });
});
app.listen(port, () => {
  console.log(`Task-tracking app listening at http://localhost:${port}`);
});
