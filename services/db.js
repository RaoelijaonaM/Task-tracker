const mysql = require('mysql2');
const config = require('../config');

const dbConnection = mysql.createConnection(config.db);
dbConnection.connect((err) => {
  if (err) {
    console.log(err);
    throw err;
  }
  console.log('database connected');
});
module.exports = dbConnection;
