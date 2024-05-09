const { getInventoryModel, updateInventoryModel } = require('../model/inventory');


// controller used to fetch the products that are available in the inventory
const getInventoryController = async(req,res) => {
  try {
      const [inventory] = await getInventoryModel();
      console.log("inventory: ", inventory);
      res.status(200).send({ data: inventory });
    } catch (error) {
      console.error("Error getting inventory items.", error);
      res.status(500).json({ error: "Error getting inventory items." });
    }
}

// controller used to update the inventory items like weight, quantity
const updateInventoryController = async(req,res) => {
  try {
      console.log("updateInventoryModel")
      const [inventory] = await updateInventoryModel(req.body);
      console.log("inventory: ", inventory);
      res.status(200).send({ data: 'Inventory updated successfully' });
    } catch (error) {
      console.error("Error updating inventory items.", error);
      res.status(500).json({ error: "Error updating inventory items." });
    }
}

module.exports = { getInventoryController, updateInventoryController };