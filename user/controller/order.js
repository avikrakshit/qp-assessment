const { bookOrderModel, mapBookOrderProductModel, updateOrderValueModel, updateOrderModel } = require('../model/order');

// Booking order of a User
const bookController = async(req,res) => {
    try {
        const order = await bookOrderModel(req.body);
        console.log("order: ", order);
        const mapOrder = await mapBookOrderProductModel(req.body, order[0].insertId);
        const updateOrderValue = await updateOrderValueModel(order[0].insertId);
        res.status(200).json({ data: `Order booked succesfully. OrderId: ${order[0].insertId}` });
      } catch (error) {
        console.error("Error creating order:", error);
        res.status(500).json({ error: "Error creating order." });
      }
}

//updating the order
const updateOrderController = async(req,res) => {
  try {
      const order = await updateOrderModel(req.body);
      console.log("order: ", order);
      const mapOrder = await mapBookOrderProductModel(req.body, req.body.orderId);
      const updateOrderValue = await updateOrderValueModel(req.body.orderId);
      res.status(200).json({ data: `Order updated succesfully. OrderId: ${req.body.orderId}` });
    } catch (error) {
      console.error("Error updating order:", error);
      res.status(500).json({ error: "Error updating order." });
    }
}


module.exports = { bookController, updateOrderController };