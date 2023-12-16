const express = require('express');
const Product = require('../models/product');
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