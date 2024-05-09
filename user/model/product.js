const { createDatabaseConnection } = require('../configuration/database');

const ProductModel= async() => {
    const sql = `
        SELECT 
            p.*,
            pc.name as category
        FROM product p
        INNER JOIN product_category pc on pc.id=p.category_id 
        WHERE p.active=1
    `;
    try {
        const connection = await createDatabaseConnection();
        const result = await connection.execute(sql);
        console.log("result: ",result);
        return result;
    } catch (err) {
        console.log(err);
    }
    console.log("executing ProductModel query")
}

module.exports = { ProductModel };