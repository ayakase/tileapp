const express = require('express');
const router = express.Router();

const news = require('../app/controllers/NewsController');
router.use('/', news.useNews);

module.exports = router;