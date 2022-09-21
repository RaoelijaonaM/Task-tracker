const express = require('express');
const controller = require('../controllers/espaceController');
const router = express.Router();
router.route('/space/:espace').get(controller.getSpaceDetails);
router.route('/members/:espace').get(controller.getSpaceMembers);
router.route('/espace/:user').get(controller.getMySpace);
router.route('/espaces').get(controller.getAllSpaces);
router.route('/theseLibre').get(controller.getTheseWithoutSpace);

module.exports = router;
