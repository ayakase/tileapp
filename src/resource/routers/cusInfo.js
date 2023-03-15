const express = require('express');
const router = express.Router();

const cusInfo = require('../app/controllers/CusInfoController');
router.use('/', cusInfo.useCusInfo);

module.exports = router;