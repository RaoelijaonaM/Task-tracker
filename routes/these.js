const express = require('express');
const controller = require('../controllers/theseController');
const router = express.Router();
router.route('/these').post(controller.insertThese);
module.exports = router;
