let express = require('express'),
    app = express(),
    debug = require('debug')('app:helloworld'),
    Sigsci = require('sigsci-module-nodejs');


const PORT = process.env.PORT || 3000;

let sigsci = new Sigsci({
    //host: 'server.com',
    // host: 'localhost',
    // port: 9999
    path: '/var/run/sigsci.sock',
    socketTimeout: 100

})

function logErrors (err, req, res, next) {
  console.error(err.stack)
  next(err)
}

app.use(logErrors);
app.use(sigsci.express());

app.get('/', function (req, res) {
    res.send("Hello World!\n")
});

app.listen(PORT, function () {
    console.log(`Example app listening on port ${PORT}`)
});
