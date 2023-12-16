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




module.exports = homeRouter;