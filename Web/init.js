const express = require('express');
const app = express.apply();

app.get('/', function (req,res) {
	res.header(200);
	res.write("Fuck you!");
	res.end();
});

app.listen(8080, function (err) {
	console.log("Server started at 8080");

	if(err) {
		console.log(err);
	}
});