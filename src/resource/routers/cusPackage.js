const express = require('express');
const router = express.Router();

const cusPackage = require('../app/controllers/CusPackageController');
router.use('/', cusPackage.useCusPackage);

module.exports = router;