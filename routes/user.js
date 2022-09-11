const express = require('express');
const controller = require('../controllers/userController');
const router = express.Router();
router.route('/user/login').post(controller.login);
module.exports = router;
