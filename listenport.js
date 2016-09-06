var net = require('net'),
socket = net.Socket;
var mailer = require("nodemailer");

function sendmail(){
	
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
var testPort = function(port,host,cb){
	var nsk = new socket();
	nsk.setTimeout(1000);//设置连接超时时间  5s
	nsk.on('connect',function(){//连接状态
			nsk.destroy();//销毁
					sendmail();
			})
	.on('timeout',function(){//连接超时
			nsk.destroy();
			cb(port,'timeout');
			})
	.on('error',function(){//连接错误
			nsk.destroy();
			cb(port,'closed');
			});

	nsk.connect(port,host);//执行连接
};

testPort(4567,'127.0.0.1',function (port,action){
			
});

