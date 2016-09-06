var http =require("http");

var express = require("express");

var app = express();
http.createServer(app).listen(1337,function (){

	console.log("express is running ")
});

app.get("/nsws",function(req,res){
	
	console.log(req.hostname);
})

app.get("/nsws",function(req,res){
	
	console.log(req.hostname);
})