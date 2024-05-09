const { createDatabaseConnection } = require('../configuration/database');


const addItemModel= async(productData) => {
  const sql = `
      INSERT INTO product(
        name,
        active,
        type,
        created_by,
        created_moment,
        updated_moment,
        category_id,
        mrp
      ) VALUES (
        '${productData.name}', 
        ${productData.active}, 
        ${productData.type}, 
        ${productData.userId}, 
        CURRENT_TIMESTAMP, 
        CURRENT_TIMESTAMP, 
        ${productData.categoryId}, 
        ${productData.mrp}
      )`;
  try {
      const connection = await createDatabaseConnection();
      const result = await connection.execute(sql);
      console.log("result: ",result);
      return result;
  } catch (err) {
      console.log(err);
      throw err;
  }
  console.log("executing addItem query")
}

const addInventoryModel= async(productData,productId) => {
  const sql = `
      INSERT INTO inventory_store(
        product_id,
        quantity,
        mrp,
        weight,
        moment,
        cause
      )VALUES (
          ${productId}, 
          ${productData.quantity}, 
          ${productData.mrp}, 
          ${productData.type==1?1:productData.type}, 
          CURRENT_TIMESTAMP, 
          1
        )`;
  try {
      const connection = await createDatabaseConnection();
      const result = await connection.execute(sql);
      console.log("result: ",result);
      return result;
  } catch (err) {
      console.log(err);
  }
  console.log("executing addInventory query")
}

const updateItemDetailsModel= async(productData) => {
  const sql = `
      UPDATE 
        product
      SET 
        name='${productData.name}', 
        active=${productData.active}, 
        category_id=${productData.categoryId}, 
        mrp=${productData.mrp}, 
        updated_by=${productData.userId}, 
        updated_moment=CURRENT_TIMESTAMP
        WHERE id=${productData.productId}`;
  try {
      const connection = await createDatabaseConnection();
      const result = await connection.execute(sql);
      console.log("result: ",result);
      return result;
  } catch (err) {
      console.log(err);
  }
  console.log("executing addInventory query")
}

const removeItemsModel= async(productData) => {
  const sql = `
      DELETE FROM product WHERE id=${productData.productId}
    `;
  try {
      const connection = await createDatabaseConnection();
      const result = await connection.execute(sql);
      console.log("result: ",result);
      return result;
  } catch (err) {
      console.log(err);
  }
  console.log("executing addInventory query")
}

const removeInventoryItemsModel= async(productData) => {
  const sql = `
      DELETE FROM inventory_store WHERE product_id=${productData.productId}
    `;
  try {
      const connection = await createDatabaseConnection();
      const result = await connection.execute(sql);
      console.log("result: ",result);
      return result;
  } catch (err) {
      console.log(err);
  }
  console.log("executing addInventory query")
}

const getItemModel= async(productData) => {
  const sql = `
      SELECT 
        * 
      FROM product p
      INNER JOIN inventory_store i ON i.product_id = p.id
      WHERE p.id=${productData.productId}
    `;
  try {
      const connection = await createDatabaseConnection();
      const result = await connection.execute(sql);
      console.log("result: ",result);
      return result;
  } catch (err) {
      console.log(err);
  }
  console.log("executing getItemModel query")
}


module.exports = { addItemModel, addInventoryModel, updateItemDetailsModel, removeItemsModel, removeInventoryItemsModel, getItemModel };


// class ProductModel {
//   static addProduct(productData) {
//     return new Promise((resolve, reject) => {
//       const sql = `INSERT INTO product(
//           name,
//           active,
//           type,
//           created_by,
//           created_moment,
//           updated_moment,
//           category_id,
//           mrp
//         ) VALUES (
//           ?, 
//           ?, 
//           ?, 
//           ?, 
//           CURRENT_TIMESTAMP, 
//           CURRENT_TIMESTAMP, 
//           ?, 
//           ?
//         )`;
    
//       connection.query(sql, [productData.name, productData.active, productData.type, productData.userId, productData.categoryId, productData.mrp], (err, results) => {
//         if (err) {
//           reject(err);
//         } else {
//           resolve(200, "Product added successfully");
//         }
//       });
//     });
//   }

//   static addInventory(productData, productId) {
//     return new Promise((resolve, reject) => {
//       const sql = `INSERT INTO inventory_store(
//           product_id,
//           quantity,
//           mrp,
//           weight,
//           moment,
//           cause
//         ) VALUES (
//           ?, 
//           ?, 
//           ?, 
//           ?, 
//           CURRENT_TIMESTAMP, 
//           1
//         )`;
//       connection.query(sql, [productId, productData.quantity, productData.mrp, productData.type==1?1:productData.weight], (err, results) => {
//         if (err) {
//           reject(err);
//         } else {
//           resolve(200, "Product added to inventory");
//         }
//       });
//     });
//   }

//   static editProduct(productData) {
//     return new Promise((resolve, reject) => {
//       const sql = `
//         UPDATE 
//           product
//         SET 
//           name=?, 
//           active=?, 
//           visibility=?, 
//           category_id=?, 
//           mrp=?, 
//           updated_by=?, 
//           updated_moment=CURRENT_TIMESTAMP
//         WHERE id=?`;
//       connection.query(sql, [productData.name, productData.active, productData.visibility, productData.categoryId, productData.mrp, productData.userId, productData.productId], (err, results) => {
//         if (err) {
//           reject(err);
//         } else {
//           resolve();
//         }
//       });
//     });
//   }

//   static getProductById(productId) {
//     return new Promise((resolve, reject) => {
//       connection.query(`
//         SELECT 
//           * 
//         FROM product 
//         WHERE id=?`, [productId], (err, results) => {
//         if (err) {
//           reject(err);
//         } else {
//           resolve(results);
//         }
//       });
//     });
//   }

//   static getProducts() {
//     return new Promise((resolve, reject) => {
//       connection.query(`
//         SELECT 
//           *
//         FROM product`, (err, results) => {
//         if (err) {
//           reject(err);
//         } else {
//           resolve(results);
//         }
//       });
//     });
//   }

// }


