const express = require('express');
const app = express();
const port = 3000;
const path = require('path');
const nodemailer = require('nodemailer');
const bodyParse = require('body-parser');
const handlebars = require('express-handlebars');
const router = require('./routers');
const methodOverride = require('method-override');
const cookieParser = require('cookie-parser');

const mysqldb = require('../config/database/sqlConnect');
const { required } = require('nodemon/lib/config');

// Connect to DB
mysqldb.connect();

//Using cookie
app.use(cookieParser())

app.use(bodyParse.json());
app.use(bodyParse.urlencoded({ extended: true }));

// const transporter = nodemailer.createTransport({
//     host: 'smtp.gmail.com',
//     port: 587,
//     secure: false,
//     requireTLS: true,
//     service: 'gmail',
//     auth: {
//         user: '23092001anvu@gmail.com',
//         pass: 'a@12345678'
//     }
// });

// Encode URL
app.use(express.urlencoded({
    extended: true
}));

app.use(express.json());
app.use(methodOverride('_method'));


app.engine('html', require('ejs').renderFile);

// Access to static file
app.use(express.static(path.join(__dirname, '../public')));

// Template engine
const hbs = handlebars.create({
    extname: '.hbs',
    
    //create custom helpers
    helpers: {
        json: function(context) {
            return JSON.stringify(context);
        }
    }
})
app.engine('hbs', hbs.engine);
app.set('view engine', 'hbs');
app.set('views', path.join(__dirname, 'views'));


// app.post('/contact.html', function (req, res, next) {
//     var guess_name = req.body.Name;
//     var guess_mail = req.body.email;
//     var guess_subject = req.body.subject;
//     var guess_content = req.body.message;

//     var content = ""Mail from  + guess_name + " email là: " + guess_mail + "\n"  + guess_content;

//     var mailOptions = {
//         from: guess_mail,
//         to: '23092001anvu@gmail.com',
//         subject: guess_subject,
//         text: content
//     };

//     transporter.sendMail(mailOptions, function (error, info) {
//         if (error) {
//             console.log(error);
//         } else {
//             console.log('Email sent: ' + info.response);
//             res.redirect('/contact.html');
//         }
//     });
    

// })


// Router init
router(app);

// Start server
app.listen(port, () => {
    console.log(`App listening at http://localhost:${port}`)
})