const { ProductModel } = require('../model/product');

const viewItemsController= async (req,res) => {
  try {
    const [product] = await ProductModel();
    console.log("product: ", product);
    if (product.length === 0) {
      res.status(200).json({ error: "No items available at this moment." });
    } else {
      res.status(200).json({ data: product });
    }
  } catch (error) {
    console.error("Error getting product:", error);
    res.status(500).json({ error: "Error getting product." });
  }
}


module.exports = { viewItemsController };