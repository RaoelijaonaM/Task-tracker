const express = require('express');
const controller = require('../controllers/taskController');
const router = express.Router();

router.route('/tasks/:espace').get(controller.getAllTasksBySpace);
router.route('/task/:tache').get(controller.getTaskById);
router.route('/task/').post(controller.createTasks);
router.route('/task/:tache').put(controller.updateTask);

module.exports = router;
