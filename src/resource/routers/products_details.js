const express = require('express');
const router = express.Router();

const products_details = require('../app/controllers/ProductsDetailsController');
router.use('/', products_details.useProductsDetails);

module.exports = router;