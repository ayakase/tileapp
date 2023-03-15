const mainRouter = require('./main');
const contact = require('./contact');
const register = require('./register');
const intro = require('./intro');
const recruit = require('./recruit');
const products = require('./products');
const products_details = require ('./products_details');
const news = require('./news');
const cart = require('./cart');
const category = require('./category');
const cusInfo = require('./cusInfo');
const cusPackage = require('./cusPackage');
const editCusInfo = require('./editCusInfo');

function router(app) {
    app.use('/editCusInfo', editCusInfo);
    app.use('/cusInfo', cusInfo);
    app.use('/cusPackage', cusPackage);
    app.use('/category', category);
    app.use('/cart', cart);
    app.use('/news', news);
    app.use('/products_details', products_details);
    app.use('/products', products);
    app.use('/recruit', recruit);
    app.use('/register', register);
    app.use('/contact', contact);
    app.use('/intro', intro)
    app.use('/', mainRouter);
}

module.exports = router;