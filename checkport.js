var net  =require("net");
var mailer = require("nodemailer");

var monitor  = function (){
    var _self = this;
};

var sysmailer = function (){
    var _self  =this ;
};

monitor.prototype.checkport= function(port){

    if(port ==null || port ==undefined){
        port = 4567;
    }

    var server = net.createServer().listen(port);
    server.on('listening',function (){
        server .close();
        sysmailer.sendmail();
        console.log("nodebb port is  crush");
    });


    server.on('error',function (err){

        if(err.code=='EADDRINUSE'){
            console.log('the nodebb forum server is running');
        }

    });
}



sysmailer.sendmail = function (){

//    var transporter = mailer.createTransport('smtp',{
//        host:"smtp.exmail.qq.com",
//        port: 465,
//        secureConnection: true,
//        auth: {
//            user: "noreply@supersuer.com",
//            pass: "5374Rblt"
//        }
//
//    });
   var transporter = mailer.createTransport('smtps://noreply%40supersuer.com:5374Rblt@smtp.exmail.qq.com');
   var mailOptions = {
        from: '"Fred Foo" <noreply@supersuer.com>',
        to: 'gaohui@supersuer.com, sunpeng@supersuer.com,zhangkun@supersuer.com',
        subject: 'Hello, superSU forum master',
        text: 'Your service has been crushed ,please check  it was no reason',
        html: ''
    };


    transporter.sendMail(mailOptions, function(error, info){
        if(error){
            return console.log(error);
        }
        console.log('Message sent: ' + info.response);
    });
}



var  nodemonitor = new monitor();
nodemonitor.checkport();