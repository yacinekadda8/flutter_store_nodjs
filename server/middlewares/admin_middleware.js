// Importing the JWT library and the User model
const jwt = require("jsonwebtoken");
const User = require("../models/user");

// Middleware for checking admin privileges
const admin = async (req, res, next) => {
  try {
    // Attempt to retrieve the JWT from the 'app-auth-token' header
    const token = req.header("app-auth-token");

    // If the token is not present, respond with a 401 status and a message
    if (!token) res.status(401).json({ msg: "Not Authorised" });

    // Verify the token using the 'jwt.verify' method and a secret key
    const verified = jwt.verify(token, "defaultSecretKey");

    // If verification fails, respond with a 401 status and a different message
    if (!verified) res.status(401).json({ msg: "Token not allowed" });

    // Find the user in the database based on the ID in the verified token
    const user = await User.findById(verified.id);

    // Check if the user has admin privileges; if not, respond with a 401 status
    if (user.type == "user" || user.type == "seller") {
      return res.status(401).json({ msg: "Not Authorised, Admin only!" });
    } else {
      // If the user has admin privileges, set user ID and token in the request object
      req.user = verified.id;
      req.token = token;

      // Call the next middleware or route handler
      next();
    }
  } catch (e) {
    // If an error occurs, respond with a 500 status and an error message
    res.status(500).json({ error: e.message });
  }
};

// Export the middleware function for use in other parts of the application
module.exports = admin;
