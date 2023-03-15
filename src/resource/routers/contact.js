const express = require('express');
const router = express.Router();

const contact = require('../app/controllers/ContactController');
router.use('/', contact.useContact);

module.exports = router;