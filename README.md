#文件清单 

1.checkport.js 是监控脚本
2.npminstall 安装所有插件
3.register_user 注册用户

另附：

forever start --minUptime 1000 --spinSleepTime 1000 /data/servertools/listenport.js
防止 forever 运行失败
