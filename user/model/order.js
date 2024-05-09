const { createDatabaseConnection } = require('../configuration/database');

const bookOrderModel= async(orderData) => {
    console.log("orderData:", orderData)
    const sql = `
        INSERT INTO user_order(
            total,
            buyer_name,
            buyer_phone,
            placed_date,
            placed_time,
            status,
            updated_by
        )VALUES(
            0,
            '${orderData.buyerName}',
            '${orderData.buyerPhone}',
            CURDATE(),
            CURTIME(),
            1,
            ${orderData.userId}
        )
    `;
    try {
        const connection = await createDatabaseConnection();
        const result = await connection.execute(sql);
        console.log("result: ",result);
        return result;
    } catch (err) {
        console.log(err);
    }
    console.log("executing BookOrderModel query")
}

const updateOrderModel= async(orderData) => {
    console.log("executing BookOrderModel query")
    const sql = `
        UPDATE
            user_order
        SET
            buyer_name='${orderData.buyerName}',
            buyer_phone='${orderData.buyerPhone}',
            updated_by=${orderData.userId},
            updated_moment=CURRENT_TIMESTAMP
        WHERE 
            id=${orderData.orderId}
    `;
    try {
        const connection = await createDatabaseConnection();
        const result = await connection.execute(sql);
        console.log("result: ",result);
        return result;
    } catch (err) {
        throw err;
    }
}

const mapBookOrderProductModel= async(orderData,orderId) => {
    const sql=`
        INSERT INTO map_user_order_product(
            order_id,
            product_id,
            quantity,
            weight,
            rate
        )SELECT
            ${orderId},
            T_P.product_id,
            IF(p.type=1, T_P.qty, 1),
            IF(p.type=1, 1, T_P.weight),
            p.mrp
        FROM (${orderData.products.map(p=> `SELECT ${p.id} as product_id, ${p.weight} as weight, ${p.qty} as qty`).join(" UNION ")}) T_P
        INNER JOIN product p ON p.id=T_P.product_id
        ON DUPLICATE KEY UPDATE
            quantity=VALUES(quantity),
            weight=VALUES(weight)
    `;
    try {
        const connection = await createDatabaseConnection();
        const result = await connection.execute(sql);
        console.log("result: ",result);
        return result;
    } catch (err) {
        console.log(err);
        throw new err("Something went wrong");
    }
}

const updateOrderValueModel = async(orderId)=> {
    const sql = `
        UPDATE 
            user_order
        SET
            total = (SELECT SUM(total) FROM map_user_order_product WHERE order_id=${orderId})
        WHERE 
            id=${orderId}
    `;
    try {
        const connection = await createDatabaseConnection();
        const result = await connection.execute(sql);
        console.log("result: ",result);
        return result;
    } catch (err) {
        console.log(err);
        throw new err("Something went wrong");
    }
}


module.exports = { bookOrderModel, mapBookOrderProductModel, updateOrderValueModel, updateOrderModel } ;