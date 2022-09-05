const express = require('express');
const controller = require('../controllers/taskController');
const router = express.Router();

router.route('/tasks/').get(controller.getAllTasksBySpace);
router.route('/task/').post(controller.createTasks);
router.route('/task/:tache').put(controller.updateTask);

module.exports = router;
