const express = require('express');
const controller = require('../controllers/taskController');
const alarme = require('../controllers/repetitionController');
const router = express.Router();

router.route('/tasks/:espace').get(controller.getAllTasksBySpace);
router.route('/task/:tache').get(controller.getTaskById);
router.route('/task/').post(controller.createTasks);
router.route('/task/:tache').put(controller.updateTaskStatus);
router.route('/taskDetail/:tache').put(controller.updateTask);
router.route('/reps').get(alarme.getAllRepetion);
router.route('/alarms').get(alarme.getAllAlarms);

module.exports = router;
