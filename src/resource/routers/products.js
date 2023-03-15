const express = require('express');
const router = express.Router();

const products = require('../app/controllers/ProductsController');

router.use('/page/:slug', products.getProductsByPage);
router.use('/', products.getProducts);


module.exports = router;