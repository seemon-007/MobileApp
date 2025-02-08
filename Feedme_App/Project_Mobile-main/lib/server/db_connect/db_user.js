const mysql = require('mysql2');
require('dotenv').config();

const db = mysql.createPool({  // ✅ ใช้ createPool() แทน createConnection()
    host: process.env.DB_HOST || '127.0.0.1',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASS || '1234',
    database: process.env.DB_NAME || 'mydata',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
}).promise(); // ✅ ใช้ .promise() เพื่อรองรับ async/await

// ✅ เชื่อมต่อและตรวจสอบ
db.getConnection()
    .then(connection => {
        console.log("✅ เชื่อมต่อฐานข้อมูลสำเร็จ");
        connection.release();
    })
    .catch(err => {
        console.error("❌ ไม่สามารถเชื่อมต่อฐานข้อมูลได้:", err.message);
    });

module.exports = db;
