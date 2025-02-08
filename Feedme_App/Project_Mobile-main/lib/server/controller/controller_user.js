const express = require('express');
const router = express.Router(); // ใช้ router แทน app
const db = require('../db_connect/db_user');
exports.registerUser = (req, res) => {
    const { name, Password, Email, Phone, address } = req.body;
    console.log(req.body);
    console.log(req.body);
    if (!name || !Password || !Email || !Phone ||!address ) {
        return res.status(400).send('All fields are required!');
      }

    const query = 'INSERT INTO customer (name, Password, Email, Phone, address, ) VALUES ( ?, ?, ?, ?, ?, ?)';

    console.log('SQL Query:', query);
        console.log('Values:', [name, Password, Email, Phone, address ]);

    db.query(query, [name, Password, Email, Phone, address ], (err, results) => {
        if (err) {
            console.error('Error registering user:', err);
            return res.status(500).send('Failed to register');
        }
        res.send('User registered successfully');
    });
};
exports.getUsers = async (req, res) => {
    try {
        const [rows] = await db.query('SELECT * FROM customer');
        res.status(200).json(rows);
    } catch (err) {
        console.error('Database error:', err);
        res.status(500).json({ error: 'Database query failed' });
    }
};

// ดึงข้อมูลผู้ใช้ตาม ID
exports.getUserById = async (req, res) => {
    try {
        const { id } = req.params;
        const [rows] = await db.query('SELECT * FROM customer WHERE customer_id = ?', [id]);

        if (rows.length === 0) {
            return res.status(404).json({ error: 'User not found' });
        }

        res.json(rows[0]);
    } catch (err) {
        console.error('Database error:', err);
        res.status(500).json({ error: 'Database query failed' });
    }
};