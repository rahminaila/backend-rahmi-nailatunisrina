const express = require('express');
const logger = require('./api/config/logger');
const {port, env} = require('./api/config/vars');
const routes = require('./api/routes');
const bodyParser = require('body-parser');
// const db = require('./api/models');
const schedulers = require('./schedulers/hello');

const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.use('/MarketPlace', routes);

const Sequelize = require ('sequelize');

const sequelize = new Sequelize(process.env.DB_NAME, process.env.DB_USER, process.env.DB_PASSWORD, {
    'host' : process.env.DB_HOST,
    'dialect' : process.env.DB_DIALECT,
    'port' : process.env.DB_PORT,
    'logging' : false
  })


sequelize
  .authenticate()
  .then(() => {
    // eslint-disable-next-line no-console
    console.log("Connection has been established successfully.");
  })
  .catch(err => {
    // eslint-disable-next-line no-console
    console.error("Unable to connect to the database:", err);
  });

app.listen(3000, () => logger.info(`server started on port ${port} (${env})`));

schedulers.hello()

module.exports = app;
