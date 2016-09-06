#centos 安装 nginx错误

CentOS 6.2 安装Nginx时报错
 
错误提示：
./configure: error: the HTTP rewrite module requires the PCRE library.
 
安装pcre-devel与openssl-devel解决问题
 
yum -y install pcre-devel openssl openssl-devel
 
./configure --prefix=/usr/local/nginx
make
make install