const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const userRoutes = require('./Routes/Routes_regis');
//const authRoutes = require('./Routes/authRoutes');
const productRoutes = require('./Routes/productRoutes');
const paymentRoutes = require('./Routes/paymentRoutes');
const profileRoutes = require('./Routes/profileRoutes'); // ✅ เก็บไว้แค่ 1 ครั้ง
const bannerRoutes = require('./Routes/bannerRoutes');
const cartRoutes = require("./Routes/cartRoutes");
const orderRoutes = require("./Routes/orderRoutes");
//const osmRoutes = require('./routes/osmRoutes');
const userAuthRoutes = require('./Routes/userAuthRoutes');
//const userAuthController = require('../controllers/userAuthController');
const homepagePromotionsRoutes = require('./Routes/homepagePromotionsRoutes');
const multer = require('multer');
const fs = require("fs");
const path = require("path");
const mysql = require('mysql2');

const app = express();
const port = 3004;
require('dotenv').config();

app.use(express.urlencoded({ extended: true }));
app.use(cors());
app.use(express.json());
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "uploads/");
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + path.extname(file.originalname));
  },
});
const upload = multer({ storage });

if (!fs.existsSync("uploads")) {
  fs.mkdirSync("uploads");
}
app.use(bodyParser.json());
app.use('/api', profileRoutes);
app.use('/api', productRoutes);
app.use("/uploads", express.static("uploads"));
app.use('/api/users', userRoutes);
//app.use('/api/auth', authRoutes);
app.use('/api/products', productRoutes);
//app.use('/api/orders', orderRoutes);
app.use('/api/payments', paymentRoutes);
app.use('/banner', bannerRoutes);
app.use('/api/cart', cartRoutes);
app.use('/api/auth', userAuthRoutes);
app.use('/api/homepage-promotions', homepagePromotionsRoutes);
//app.use('/osm', osmRoutes);
app.use("/api/orders", orderRoutes);

app.post('/upload', upload.single('file'), (req, res) => {
  res.send('File uploaded successfully');
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
