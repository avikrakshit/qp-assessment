const express = require('express');
const router = express.Router();
const { getInventoryController,updateInventoryController } = require('../controller/inventory');


router.get('/', getInventoryController);
router.patch('/', updateInventoryController);


module.exports = router 
