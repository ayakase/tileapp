const { Cookie } = require('express-session');
const jwt = require('jsonwebtoken');


const mysqldb = require('../../../config/database/sqlConnect');
const jwtEncode = require('../../../config/database/jwtEncode');

class Cart {
    useCart(req, res, next) {
        try {
            if (req.originalMethod == 'GET') {
                var token = req.cookies.token;
                var account_verify = jwt.verify(token, jwtEncode.jwtEncode());
                if (account_verify) {
                    res.render('cart', { error: false, errorLog: '', User: 'UsernameBug', signin: true });
                } else {
                    res.render('cart', { error: false, errorLog: '', User: '',  signin: false });
                }
            }
        } catch {
            res.render('cart', { error: false, errorLog: '', User: '',  signin: false });
        }

        if (req.originalMethod == 'POST') {
            var signinQuery = function (acc, pass) {
                return "select * from accounts where user_name = '" + acc + "' and password = '" + pass + "'";
            };

            mysqldb.connect().query(signinQuery(req.body.user_account, req.body.user_password), function (err1, result1, fields1) {
                if (err1) {
                    res.send(err);
                } else {
                    if (result1.length == 1) {
                        var token = jwt.sign({
                            user_account: result1[0].user_account
                        }, jwtEncode.jwtEncode());
                        res.cookie('token', token, { expire: 400000 + Date.now() });
                        res.render('homepage', { error: false, errorLog: '', User: req.body.user_account,  signin: true });
                        
                    } else {
                        res.render('homepage', { error: true, errorLog: '*Sai tài khoản hoặc mật khẩu', Code: req.body.Code, signin: false });
                    }
                }
            })
        }

    }
}
module.exports = new Cart;