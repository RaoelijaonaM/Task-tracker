const express = require('express');
const controller = require('../controllers/discussionController');
const router = express.Router();
router.route('/message').post(controller.insertMessage);
router.route('/messages/:espace').get(controller.getMessagesBySpace);

module.exports = router;
