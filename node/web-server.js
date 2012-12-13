var http = require('http');
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello\n');
  setTimeout(function(){
		res.end("world\n");
	}, 2000);
}).listen(1337, '127.0.0.1');
console.log('Server running at http://127.0.0.1:1337/');