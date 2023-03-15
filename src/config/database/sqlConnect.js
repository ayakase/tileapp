const mysql = require('mysql');
var db = null;

function connect() {
    if(!db) {
        const mysqldb = mysql.createConnection({
            host: 'localhost',
            user: 'root',
            password: 'a@12345678',
            database: 'tileweb'
        });
        mysqldb.connect((err) => {
            if(err) {
                console.log("error");
            } else {
                console.log('Connected to mysql succesfully')
            }
        });
        db = mysqldb;
    }
    return db;
}

module.exports = { connect };