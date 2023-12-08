
const jwt = require('jsonwebtoken');

const jwtSecretKey = process.env.JWT_SECRET_KEY ;

// Middleware function for authentication using JWT
const auth = async (req,res,next)=>{
try {
    // Extract the JWT (JSON Web Token) from the request headers
    const token = req.header('x-auth-token');
    // If no token is provided, return a 401 Unauthorized response
    if(!token) return res.status(401).json({msg: "Access denied, No auth token."});
    // Verify the authenticity of the token using the JWT library and secret key
    const verified = jwt.verify(token,jwtSecretKey);
    // If token verification fails, return a 401 Unauthorized response
    if (!verified) return res.status(401).json({msg:"Token is not valid"});
    // Attach the user ID from the token to the request for further use
    req.user = verified.indexOf;
    // Attach the token to the request for further use
    req.token = token;
    // Move on to the next middleware or route handler
    next();
} catch (e) {
    // Handle any unexpected errors and return a 500 Internal Server Error response
    res.status(500).json({error:e.message});
}
};
module.exports = auth;
