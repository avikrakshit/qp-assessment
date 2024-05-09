// routes/productRoutes.js
const express = require('express');
const router = express.Router();
const { bookController,updateOrderController } = require('../controller/order')

router.post('/', bookController);
router.patch('/', updateOrderController);

module.exports = router;
