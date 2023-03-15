const express = require('express');
const router = express.Router();

const cate = require('../app/controllers/CategoryController');

router.use('/:cate/page/:slug', cate.getProductsByCateAndPage);
router.use('/:cate/', cate.getProductsByCate);

module.exports = router;