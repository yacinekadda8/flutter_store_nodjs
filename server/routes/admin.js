const express = require('express');
const admin = require('../middlewares/admin_middleware');
const Product = require('../models/product');
const adminRouter = express.Router();


// get add new product
adminRouter.post('/admin/add-product',admin,async (req,res)=>{
    try {
        const {name,description,images,price,quantity,discount,category} = req.body;
        let product = new Product({name,description,images,price,quantity,discount,category});
        product = product.save();
        res.json(product);
    } catch (e) {
        res.status(500).json({error:e.message});
    }
});
// get all products
adminRouter.get('/admin/get-products',admin,async(req,res)=>{
    try {
        const products = await Product.find({});
        res.status(200).json(products);
    } catch (e) {
        res.status(500).json({error:e.message});
    }
});

// delete a product
adminRouter.post('/admin/delete-product',admin,async(req,res)=>{
    try{
        const {id} = req.body; 
        let product = await Product.findByIdAndDelete(id); 
        //product = product.save();
        //res.json({msg:"Product Deleted Successfuly"})
        res.json(product);
    }catch(e){
        res.status(500).json({error:e.message}); 
    }
});

module.exports = adminRouter;