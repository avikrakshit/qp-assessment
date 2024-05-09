const mysql = require('mysql2/promise');


const createDatabaseConnection = async() => {
  const connection = await mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "grocery_management_system"
  });
  return connection;
}


module.exports = { createDatabaseConnection };
