const express = require("express");
const router = express.Router();
const { saveOrder } = require("../controller/controller_order"); // ✅ ใช้ `{ saveOrder }`

// ✅ ใช้ `saveOrder` อย่างถูกต้อง
router.post("/save", saveOrder);

module.exports = router;