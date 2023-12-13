// Import MODULES from PACKAGES and assign them to Variables;
const express = require("express");
const bcryptJs = require("bcryptjs");
const jwt = require("jsonwebtoken");

// Import Module and Middlewares from Files
const authRouter = express.Router();
const User = require("../models/user"); // Assuming you have a User model defined in the 'user' file
const myAuth = require("../middlewares/auth_middleware");


// ------- Register
authRouter.post("/api/signup", async (req, res) => {
  try {
    const { name, email, password } = req.body;

    // // Check if email is badly formatted
    // if (!validateEmail(email)) {
    //     return res.status(400).json({ msg: "Invalid email format" });
    // }

    // Check if the email is already in use
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(400).json({ msg: "This email is already in use" });
    }

    // Hash the password before saving it to the database
    const hashedPassword = await bcryptJs.hash(password, 8);

    // Create a new User instance and save it to the database
    let user = new User({ name, email, password: await hashedPassword });
    user = await user.save();
    res.json(user); // Return the saved user information
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// ------- Login
authRouter.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;

    // Find the user in the database based on the provided email
    const user = await User.findOne({ email });
    if (!user) {
      return res.status(400).json({ msg: "User does not exist" });
    }

    // Compare the provided password with the hashed password stored in the database
    const isMatch = await bcryptJs.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ msg: "Incorrect Email or Password" });
    }

    // If the password is correct, generate a JWT token for authentication
    const token = jwt.sign({ id: user.id }, "defaultSecretKey");

    // Return the token and user information (excluding the password) in the response
    res.json({ token, ...user._doc });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

authRouter.post('/isValidToken', async (req, res) => {
  try {
     const token = req.header('app-auth-token');
     if(!token) return res.json(false);
     const verified = jwt.verify(token, "defaultSecretKey" );
     if (!verified) {
        return res.json(false); 
     } else  {
         const user = await User.findById(verified.id);
         if (!user) {
           return res.json(false); 
         } else {
           return res.json(true); 
         } 
     }
  } catch (e) {
   res.status(500).json({error: e.message});
  }
});

authRouter.get('/', myAuth, async  (req, res) => {

   const user = await User.findById(req.user);
   res.json({ ...user._doc, token: req.token });
});


// Export the authRouter for use in other parts of your application
module.exports = authRouter;
