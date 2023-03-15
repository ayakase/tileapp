const express = require('express');
const router = express.Router();

const register = require('../app/controllers/RegisController');

router.post('/sign-up', register.postSignUp)
router.use('/', register.useRegister);

module.exports = router;