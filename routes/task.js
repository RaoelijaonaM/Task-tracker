const express = require('express');
const controller = require('../controllers/taskController');
const filecontroller = require('../controllers/fileController');
const alarme = require('../controllers/repetitionController');
const router = express.Router();

router.route('/tasks/:espace').get(controller.getAllTasksBySpace);
router.route('/task/:tache').get(controller.getTaskById);
router.route('/task/').post(controller.createTasks);
router.route('/task/:tache').put(controller.updateTaskStatus);
router.route('/taskDetail/:tache').put(controller.updateTask);
router.route('/reps').get(alarme.getAllRepetion);
router.route('/alarms').get(alarme.getAllAlarms);
router.route('/alarms/:tache').get(alarme.getAlarmDetailByTache);
router.route('/notifs').get(controller.sendNotif);
router.route('/task/file').post(filecontroller.insertFile);
router.route('/files/:tache').get(filecontroller.getAllFileByTask);
router.route('/files').get(filecontroller.getAllDossier);
router.route('/dossier/:etudiant').get(filecontroller.getDossierById);
router.route('/dossier').put(filecontroller.updateDossierEtudiant);

module.exports = router;
