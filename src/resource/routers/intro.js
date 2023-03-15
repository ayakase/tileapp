const express = require('express');
const router = express.Router();

const intro = require('../app/controllers/IntroController');
router.use('/', intro.useIntro);

module.exports = router;