"use strict"

var nconf = require('nconf');
var async = require('async');
nconf.file({file: "config.json"});
var db = require('./src/database');
var fs = require("fs");

async.waterfall([
    async.apply(db.init),
    async.apply(db.checkCompatibility),
    function (next) {
        // var userData = [{username:"test100",email:"test100@163.com",password:"111111"},{username:"test101",email:"test101@163.com",password:"111111"}];
        fs.readFile("register.json", function (err, jsondata) {
            var userData = JSON.parse(jsondata);
            userData.forEach(function (data) {
                require('./src/user.js').create({username: data.username, email: data.email, password: data.password }, function (err, uid) {
                    if (err != null) {
                        console.log("注册失败,错误：" + err);
                    } else {
                        console.log("注册成功 uid : " + uid);
                    }
                });

            });
        });
        
    }
], function (err) {
    if (err != null) {
        console.log("执行错误 error " + err);
    }
});
                   

