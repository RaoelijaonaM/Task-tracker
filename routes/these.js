const express = require('express');
const controller = require('../controllers/theseController');
const sout = require('../controllers/soutenanceController');
const router = express.Router();
router.route('/these').post(controller.insertThese);
router.route('/soutweek').get(sout.getSoutenanceWeekDate);
router.route('/profs/:annee').get(sout.getProfTimesSoutenance);


module.exports = router;
