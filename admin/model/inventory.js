const { createDatabaseConnection } = require('../configuration/database');

// Update the Inventory
const updateInventoryModel= async(inventoryData) => {
    console.log("request body: ", inventoryData)
    const sql=`
        UPDATE
            inventory_store
        SET
            quantity=${inventoryData.quantity},
            weight=${inventoryData.weight},
            moment=CURRENT_TIMESTAMP,
            cause=2
        WHERE product_id=${inventoryData.productId}
    `;
    try {
        const connection = await createDatabaseConnection();
        const result = await connection.execute(sql);
        console.log("result: ",result);
        return result;
    } catch (err) {
        console.log(err);
    }
    console.log("executing updateInventoryModel query")
}

// view products available in the inventory 
const getInventoryModel= async() => {
    const sql=`
        SELECT 
            p.name as product,
            pc.name as category,
            i.product_id,
            i.quantity,
            i.mrp,
            i.weight,
            p.type,
            i.order_id,
            i.moment,
            i.cause
        FROM inventory_store i
        INNER JOIN product p on p.id=i.product_id
        INNER JOIN product_category pc ON pc.id=p.category_id
    `;
    try {
        const connection = await createDatabaseConnection();
        const result = await connection.execute(sql);
        console.log("result: ",result);
        return result;
    } catch (err) {
        console.log(err);
    }
    console.log("executing getInventoryModel query")
}

module.exports = { getInventoryModel, updateInventoryModel };