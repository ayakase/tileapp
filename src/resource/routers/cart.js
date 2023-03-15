const express = require('express');
const router = express.Router();

const cart = require('../app/controllers/CartController');
router.use('/', cart.useCart);

module.exports = router;