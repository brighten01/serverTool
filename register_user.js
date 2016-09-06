"use strict"

var nconf = require('nconf');
var async = require('async');
nconf.file({file: "config.json"});
var db = require('./src/database');


async.waterfall([
    async.apply(db.init),
    async.apply(db.checkCompatibility),
    function(next){
	var userData =[{"username":"Harley","email":"lihan@supersuer.com","password":"SuperSU1314"},{"username":"Toby ","email":"help@supersuer.com","password":"SuperSU1314"}];
    userData.forEach(function(data){
        require('./src/user.js').create({username: data.username, email: data.email, password: data.password }, function (err, uid) {
            if (err != null) {
                console.log("注册失败,错误：" + err);
            } else {
                console.log("注册成功 uid : " + uid);
            }
     });
    
    });
         
    }
], function (err) {
    if (err != null) {
        console.log("执行错误 error " + err);
    }
});
                   

