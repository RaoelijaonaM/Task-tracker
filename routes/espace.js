const express = require('express');
const controller = require('../controllers/espaceController');
const router = express.Router();
router.route('/space/:espace').get(controller.getSpaceDetails);
module.exports = router;
