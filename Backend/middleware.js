const jwt = require('jsonwebtoken');

let checkToken = (req, res, next) => {
    let token = req.headers['authorization'];
    console.log(token);
    token = token.slice(7, token.length);
    if (token) {
        jwt.verify(token, 'ThirdSemProj@123', (err, decoded) => {
            if (err) {
                return res.json({
                    status: false,
                    msg: 'Token Invalid',
                });
            } else {
                req.decoded = decoded;
                next();
            }
        });
    } else {
        return res.json({
            status: false,
            msg: 'Token not provided',
        });
    }
};

module.exports = {
    checkToken: checkToken,
};
