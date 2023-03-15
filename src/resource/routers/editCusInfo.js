const express = require('express');
const router = express.Router();

const editCusInfo = require('../app/controllers/EditCusInfoController');
router.use('/', editCusInfo.useEditCusInfo);

module.exports = router;