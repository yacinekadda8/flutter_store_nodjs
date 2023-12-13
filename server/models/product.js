const mongoose = require("mongoose");

// Define a Mongoose schema for the Product model
const productSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },
  description: {
    type: String,
    required: true,
  },
  category: {
    type: String,
    required: true,
  },
  price: {
    type: Number,
    required: true,
  },
  quantity: {
    type: Number,
    required: true,
  },
  images: [
    {
      type: String,
      required: true,
    },
  ],
  //Ratings
});
// Create a Mongoose model named 'Product' using the schema
const Product = mongoose.model("Product", productSchema);
// Export the Product model to be used in other parts of the application
module.exports = Product;
