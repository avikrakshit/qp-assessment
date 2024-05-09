// routes/productRoutes.js
const express = require('express');
const router = express.Router();
const { viewItemsController } = require('../controller/product')


router.get('/', viewItemsController);

module.exports = router;
