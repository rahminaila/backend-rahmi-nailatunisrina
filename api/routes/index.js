const express = require('express');
const helloRoutes = require('./hello.route');
const controller = require('../controllers/index');
const merchantController = require('../controllers/merchant.controller')
const customerController = require('../controllers/customer.controller')
const verifyToken = require('../middleware/auth');
const authController = require('../controllers/auth.controller')
const router = express.Router();

router.route('/getToken')
  .post(authController.getToken);

router.route('/cek')
  .get(verifyToken, controller.cek)

router.route('/createMerchant')
  .post(verifyToken, merchantController.createMerchant)

router.route('/createProduct')
  .post(verifyToken, merchantController.createProduct)

router.route('/updateProduct')
  .put(verifyToken, merchantController.updateProduct)

router.route('/deleteProduct')
  .delete(verifyToken, merchantController.deleteProduct)

router.route('/getListCustomer')
  .get(verifyToken, merchantController.getListCustomer)

router.route('/getListProduct')
  .get(verifyToken, customerController.getListProduct)

router.route('/buyProduct')
  .post(verifyToken, customerController.buyProduct)

router.route('/createCustomer')
  .post(verifyToken, customerController.createCustomer)

module.exports = router;
