const express = require('express');
const controller = require('../controllers/espaceController');
const router = express.Router();
router.route('/space/:espace').get(controller.getSpaceDetails);
router.route('/members/:espace').get(controller.getSpaceMembers);
module.exports = router;
