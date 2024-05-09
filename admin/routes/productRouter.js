// routes/productRoutes.js
const express = require('express');
const router = express.Router();
const { addProductController, removeProductController, updateItemDetailsController } = require('../controller/product');


router.post('/', addProductController)
router.delete('/', removeProductController)
router.patch('/', updateItemDetailsController)


module.exports = router ;
