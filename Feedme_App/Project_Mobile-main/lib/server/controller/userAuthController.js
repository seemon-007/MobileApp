const db = require('../db_connect/db_user'); // ✅ เชื่อมต่อฐานข้อมูล
const bcrypt = require('bcrypt'); // ✅ ใช้ bcrypt

exports.userLogin = async (req, res) => {
    try {
        const { customer_id, Password } = req.body;
        console.log(req.body);

        if (!customer_id || !Password) {
            return res.status(400).json({ message: 'customer_id and Password are required!' });
        }

        // ค้นหา user โดยใช้ customer_id
        const query = `SELECT * FROM customer WHERE customer_id = ?`;
        console.log('Query:', query);

        // Use promise-based query with async/await
        const [results] = await db.promise().query(query, [customer_id]); // Use promise()

        console.log('Query Results:', results);

        if (results.length > 0) {
            const user = results[0];

            // ✅ เช็ค Password ด้วย bcrypt
            console.log('User from database:', user);

            // เช็ค password
            if (Password != user.Password) {
                console.log('Password mismatch');
                return res.status(401).json({ message: 'Invalid Customer ID or Password' });
            }

            console.log('Login successful');
            res.status(200).json({
                message: 'Login successful',
                customer_id: user.customer_id,
                role: user.role,
            });
        } else {
            console.log('No user found with the given customer_id');
            return res.status(401).json({ message: 'Invalid Customer ID or Password' });
        }
    } catch (error) {
        console.error('Error in userLogin:', error);
        res.status(500).json({ message: 'Internal server error' });
    }
};
