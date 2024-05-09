const { addItemModel, addInventoryModel, updateItemDetailsModel, removeItemsModel, removeInventoryItemsModel, getItemModel } = require('../model/product');


const addProductController=async(req,res)=>{
  console.log("addProductController: ")
  try {
    const [items] = await addItemModel(req.body);
    const [inventory] = await addInventoryModel(req.body, items.insertId);
    console.log("inventory: ", inventory);
    res.status(200).send({ data: 'Product added successfully' });
  } catch (error) {
    if(error.errno==1062){
      res.status(500).json({ error: "Can't add the product. The product already exists." });
    }
    res.status(500).json({ error: "Error adding the product." });
  }
}

const removeProductController=async(req,res)=>{
  try {
    const [[foundItem]] = await getItemModel(req.body);
    console.log("item found: ", foundItem);
    if(!foundItem){
      res.status(200).send({ data: 'No item found for deletion' });
    }else{
      const [items] = await removeItemsModel(req.body);
      console.log("items: ", items.insertId)
      const [inventoryItem] = await removeInventoryItemsModel(req.body);
      res.status(200).send({ data: 'Product removed successfully' });
    }
  } catch (error) {
    console.error("Error removing order:", error);
    res.status(500).json({ error: "Error removing the item." });
  }
}

const updateItemDetailsController=async(req,res)=>{
  try {
    const [items] = await updateItemDetailsModel(req.body);
    console.log("items: ", items.insertId)
    res.status(200).send({ data: 'Product updated successfully' });
  } catch (error) {
    console.error("Error updating product :", error);
    res.status(500).json({ error: "Error updating the item." });
  }
}



module.exports = { addProductController, removeProductController, updateItemDetailsController };

