// app.js
const express = require('express');
const app = express();
const productRouter = require('./routes/productRouter') 
const inventoryRouter = require('./routes/inventoryRouter') 


app.use(express.json());
app.use(express.urlencoded({ extended: true }));


// app.use('/admin/api/v1/view', getInventoryController);
// app.use('/admin/api/v1/update', updateInventoryController); 
// app.use('/admin/api/v1/createProduct', addProductController); 
// app.use('/admin/api/v1/remove', removeProductController); 
// app.use('/admin/api/v1/UpdateProduct', updateItemDetailsController); 

app.use('/admin/api/v1/product', productRouter);
app.use('/admin/api/v1/inventory', inventoryRouter);



app.listen(8080, () => {
  console.log(`Example app listening on port 8080`);
});
