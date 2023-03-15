const { Cookie } = require('express-session');
const jwt = require('jsonwebtoken');


const mysqldb = require('../../../config/database/sqlConnect');
const jwtEncode = require('../../../config/database/jwtEncode');

class Register {
    useRegister(req, res, next) {
        try {
            if (req.originalMethod == 'GET') {
                var token = req.cookies.token;
                var account_verify = jwt.verify(token, jwtEncode.jwtEncode());
                if (account_verify) {
                    res.render('register', { error: false, errorLog: '', User: 'UsernameBug', signin: true });
                } else {
                    res.render('register', { error: false, errorLog: '', User: '', signin: false });
                }
            }
        } catch {
            res.render('register', { error: false, errorLog: '', User: '', signin: false });
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
                        res.redirect('/');
                    } else {
                        res.render('register', { error: true, errorLog: '*Sai tài khoản hoặc mật khẩu', User: req.body.user_account, signin: false });
                    }
                }
            })
        }

    }

    postSignUp(req, res, next) {
        if (req.originalMethod == 'POST') {
            if (req.body.signUpPass != req.body.signUpConfirmPass) {
                res.render('register', { wrongSignUp: req.body, errorReport: ['Mật khẩu xác nhận không trùng khớp!'] });
                return;
            }
        }
        var signUpQuery = function (reqBody) {
            return "insert into accounts(user_name, password, fullname, email, phone) values('"
                + reqBody.userName + "', '"
                + reqBody.signUpPass + "', '"
                + reqBody.fullname + "', '"
                + reqBody.email + "', '"
                + reqBody.phone + "');";
        };

        var checkUserNameQuery = function (reqBody) {
            return "select count(*) as isExist from accounts where user_name = '"
                + reqBody.userName + "' group by user_name;"
        };

        mysqldb.connect().query(checkUserNameQuery(req.body), function (err, result, field) {
            if (err) throw err
            else {
                if (result.length > 0) {
                    res.render('register',
                        {
                            wrongSignUp: req.body,
                            errorReport: [
                                "Tên tài khoản đã tồn tại, vui lòng chọn một tên tài khoản khác"
                            ]
                        });
                }
                else {
                    mysqldb.connect().query(signUpQuery(req.body), function (err1, result1, fields1) {
                        if (err1) throw err1;
                        else {
                            res.redirect('/');
                        }
                    });
                }
            }
        });
    }
}
module.exports = new Register;