// app.js
const express = require('express');
const app = express();
const productRouter = require('./route/productRoute');
const orderRouter = require('./route/orderRoute');

app.use(express.json());
app.use(express.urlencoded({ extended: true }));


// Prefix all product routes with /user/api/v1
app.use('/user/api/v1/product', productRouter);
app.use('/user/api/v1/order', orderRouter);

app.listen(8080, () => {
  console.log(`Example app listening on port 8080`);
});
