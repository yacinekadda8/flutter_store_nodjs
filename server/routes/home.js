const express = require('express');
const {Product} = require('../models/product');
const homeRouter = express.Router();


// get all products
homeRouter.get('/home/get-products',async(req,res)=>{
    try {
        const products = await Product.find({});
        res.status(200).json(products);
    } catch (e) {
        res.status(500).json({error:e.message});
    }
});
// get all products with discounts
homeRouter.get('/home/get-discounts-products', async (req, res) => {
  try {
      // Get products with discounts
      const productsWithDiscount = await Product.find({ discount: { $gt: 0 } });

      // Sort products by discount in descending order
      const sortedProducts = productsWithDiscount.sort((a, b) => b.discount - a.discount);

      res.status(200).json(sortedProducts);
  } catch (e) {
      res.status(500).json({ error: e.message });
  }
});

// get products of a specifec category
homeRouter.get('/home/category-products',async(req,res)=>{
    try {
        console.log(req.query.category);
        const products = await Product.find({category:req.query.category});
        res.status(200).json(products);
    } catch (e) {
        res.status(500).json({error:e.message});
    }
});
// get all products that are similar to a given product
// get more products that are similar to a given product
homeRouter.get('/home/similar-products/:productId', async (req, res) => {
  try {
    const productId = req.params.productId;

    // Find the product by ID
    const product = await Product.findById(productId);

    // If the product is not found, return an error
    if (!product) {
      return res.status(404).json({ error: 'Product not found' });
    }

    // Use a similar logic to find products with similar criteria
    const similarProducts = await Product.find({
      $or: [
        { category: product.category }, // Same category
        { name: { $regex: new RegExp(product.name, 'i') } }, // Similar name (case-insensitive)
        // Add more criteria as needed
      ],
      _id: { $ne: productId }, // Exclude the current product from the results
    });

    res.status(200).json(similarProducts);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});



// this work good
// homeRouter.get('/home/similar-products/:productId', async (req, res) => {
//   try {
//     const productId = req.params.productId;

//     // Find the product by ID
//     const product = await Product.findById(productId);

//     // If the product is not found, return an error
//     if (!product) {
//       return res.status(404).json({ error: 'Product not found' });
//     }

//     // Use a similar logic to find products with the same category or any other criteria
//     const similarProducts = await Product.find({
//       category: product.category,
//       _id: { $ne: productId }, // Exclude the current product from the results
//     });

//     res.status(200).json(similarProducts);
//   } catch (e) {
//     res.status(500).json({ error: e.message });
//   }
// });


// get all products that close to client query search 
//regular expression with a case-insensitive match
homeRouter.get('/home/search-products', async (req, res) => {
    try {
      const query = req.query.query;
      
      // Use a regular expression for a case-insensitive match
      //the 'i' is a flag that is used to make the regular expression case-insensitive.
      const regex = new RegExp(query, 'i');
  
      // Search for products where the name or description matches the query
      
      const products = await Product.find({
        $or: [
          { name: { $regex: regex } }, 
          { description: { $regex: regex } }
        ]
      });
  
      res.status(200).json(products);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });
// homeRouter.get('/home/search-products',async(req,res)=>{
//     try {
//         const products = await Product.find({name:req.query.query});
//         res.status(200).json(products);
//     } catch (e) {
//         res.status(500).json({error:e.message});
//     }
// });




module.exports = homeRouter;