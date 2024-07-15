var Sequelize = require("sequelize");

const db = new Sequelize(
  process.env.DB_NAME,
  process.env.DB_USER,
  process.env.DB_PASSWORD,
  {
    dialect: process.env.DB_DIALECT,
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    logging: false,
    pool: {
      max: 200,
      min: 0,
      idle: 20000,
      acquire: 200000
    },
    transactionType: 'IMMEDIATE' // Set this to your preferred transaction type
  }
);


db.authenticate()
  .then(function () {
    console.log('You are now connected to Database: ' + process.env.DB_HOST)
  })
  .catch(function (err) {
    console.log('cant connect to database', err)
  })



module.exports = db;