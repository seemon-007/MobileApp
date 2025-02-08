const db = require("../db_connect/db_user");

const saveOrder = async (req, res) => {
  const { customerId, productName, shippingRate, total } = req.body;

  try {
    console.log("Order data received:", { customerId, productName, shippingRate, total });

    // ✅ เพิ่ม SQL Query เพื่อบันทึกคำสั่งซื้อ
    const insertOrderQuery = "INSERT INTO `order` (customer_id, total, shipping_rate) VALUES (?, ?, ?)";

    db.query(insertOrderQuery, [customerId, total, shippingRate], (err, result) => {
      if (err) {
        console.error("Database error:", err);
        return res.status(500).json({ error: "Failed to save order." });
      }

      const orderId = result.insertId;
      res.status(201).json({
        message: "Order saved successfully",
        orderId: orderId,
      });
    });

  } catch (err) {
    console.error("Error saving order:", err);
    res.status(500).json({ error: "Failed to save order." });
  }
};

// ✅ ส่งออก `saveOrder` อย่างถูกต้อง
module.exports = { saveOrder };
