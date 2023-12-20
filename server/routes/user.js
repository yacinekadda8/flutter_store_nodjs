const express = require("express");
const userRouter = express.Router();
const { Product } = require("../models/product");
const myAuth = require("../middlewares/auth_middleware");
const User = require("../models/user");

// get add new product
userRouter.post("/api/add-product-to-cart", myAuth, async (req, res) => {
  try {
    const { id } = req.body;
    const product = new Product.findById(id);
    let user = new User.findById(req.user);
    if (user.cart.lenght == 0) {
      user.cart.push({ product, quantitiy: 1 });
    } else {
      let isProductInCart = false;
      for (let i = 0; i < user.cart.lenght; i++) {
        if (user.cart[i].product._id.equals(product._id)) {
          isProductInCart = true;
        } else {
          isProductInCart = false;
        }
      }
      if (isProductInCart) {
        let product3 = user.cart.find((product2) =>
          product2.product._id.equals(product._id)
        );
        product3.quantitiy += 1;
      } else {
        user.cart.push({ product, quantitiy: 1 });
      }
      user = await user.save();
      res.json(user);
    }
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = userRouter;
