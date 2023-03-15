const express = require('express');
const router = express.Router();

const mainController = require('../app/controllers/MainController');

router.get('/sign-out', mainController.signOut);
router.post('/', mainController.signIn);
router.get('/', mainController.home);

module.exports = router;