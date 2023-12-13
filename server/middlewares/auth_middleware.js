//This middleware is designed for authentication using JSON Web Tokens (JWT)
const jwt = require("jsonwebtoken");

// Defining the Middleware function:
const myAuth = async (req, res, next) => {
  try {
    // Attempt to retrieve the JWT from the 'app-auth-token' header
    const token = req.header("app-auth-token");

    // If the token is not present, respond with a 401 status and a message
    if (!token) {
      return res.status(401).json({ msg: "Not Authorised user" });
    }

    // Verify the token using the 'jwt.verify' method and a secret key
    const verified = jwt.verify(token, "defaultSecretKey");

    // If verification fails, respond with a 401 status and a message
    if (!verified) {
      return res.status(401).json({ msg: "Token not allawed" });
    }
    // If verification is successful, set user ID and token in the request object
    req.user = verified.id;
    req.token = token;

    // Call the next middleware or route handler
    next();
  } catch (e) {
    // If an error occurs, respond with a 500 status
    res.status(500).json({ error: e.message });
  }
};

module.exports = myAuth;
