const express = require('express');
const router = express.Router();

const recruit = require('../app/controllers/RecruitController');
router.use('/', recruit.useRecruit);

module.exports = router;