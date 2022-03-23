// run `node index.js` in the terminal

// console.log(`Hello Node.js v${process.versions.node}!`);

var http = require('http');

http
  .createServer(function (req, res) {
    res.write('Hello,a awesome Node.js!'); //write a response to the client
    res.end(); //end the response
  })
  .listen(8080); //the server object listens on port 8080

console.log('Server running on port 8080');
