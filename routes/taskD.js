const express = require('express');
const controller = require('../controllers/taskDefaultController');
const router = express.Router();

router.route('/taskDs/').get(controller.getAllDefaultTask);


module.exports = router;
