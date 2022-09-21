const express = require('express');
const controller = require('../controllers/userController');
const router = express.Router();
router.route('/user/login').post(controller.login);
router.route('/user/token').post(controller.saveTokenDevice);
router.route('/users').get(controller.getUsers);

module.exports = router;
