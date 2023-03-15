const { Cookie } = require('express-session');
const jwt = require('jsonwebtoken');


const mysqldb = require('../../../config/database/sqlConnect');
const jwtEncode = require('../../../config/database/jwtEncode');

class Products {
    getProducts(req, res, next) {
        try {
            if (req.originalMethod == 'GET') {
                mysqldb.connect().query("SELECT * FROM product p join category c on p.category_no = c.category_no LIMIT 12 OFFSET 0;", function (err, data, field) {
                    if (err) throw err;
                    else {
                        mysqldb.connect().query("SELECT * FROM category;", function (err1, data1, field) {
                            if (err1) throw err1;
                            else {
                                var token = req.cookies.token;
                                var account_verify;
                                if (token != null) account_verify = jwt.verify(token, jwtEncode.jwtEncode());
                                if (account_verify) {
                                    res.render('products', { error: false, errorLog: '', User: 'UsernameBug', signin: true, items: data, category: data1 });
                                } else {
                                    res.render('products', { error: false, errorLog: '', User: '', signin: false, items: data, category: data1 });
                                }
                            }
                        })

                    }
                })

            }
        } catch {
            res.render('products', { error: false, errorLog: '', User: '', signin: false });
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
                        res.render('homepage', { error: false, errorLog: '', User: req.body.user_account, signin: true });

                    } else {
                        res.render('homepage', { error: true, errorLog: '*Sai tài khoản hoặc mật khẩu', Code: req.body.Code, signin: false });
                    }
                }
            })
        }

    }

    getProductsByPage(req, res, next) {
        try {
            if (req.originalMethod == 'GET') {
                const slug = req.params.slug;
                var page_offset = (slug - 1) * 12;
                mysqldb.connect().query("SELECT * FROM product p join category c on p.category_no = c.category_no LIMIT 12 OFFSET " + page_offset + ";", function (err, data, field) {
                    if (err) throw err;
                    else {
                        mysqldb.connect().query("SELECT * FROM category;", function (err1, data1, field) {
                            if (err1) throw err1;
                            else {
                                var token = req.cookies.token;
                                var account_verify;
                                if (token != null) account_verify = jwt.verify(token, jwtEncode.jwtEncode());
                                if (account_verify) {
                                    res.render('products', { error: false, errorLog: '', User: 'UsernameBug', signin: true, items: data, category: data1 });
                                } else {
                                    res.render('products', { error: false, errorLog: '', User: '', signin: false, items: data, category: data1 });
                                }
                            }
                        })

                    }
                })
            }
        } catch {
            res.render('products', { error: false, errorLog: '', User: '', signin: false });
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
                        res.render('homepage', { error: false, errorLog: '', User: req.body.user_account, signin: true });

                    } else {
                        res.render('homepage', { error: true, errorLog: '*Sai tài khoản hoặc mật khẩu', Code: req.body.Code, signin: false });
                    }
                }
            })
        }

    }
}
module.exports = new Products;