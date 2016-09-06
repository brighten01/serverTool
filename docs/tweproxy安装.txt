安装tcl 

yum  install tcl

或者安装地址

https://pkgs.org/centos-6/centos-x86_64/tcl-8.5.7-6.el6.x86_64.rpm.html


安装proxy 

https://drive.google.com/drive/folders/0B6pVMMV5F5dfMUdJV25abllhUWM


下载nuttracker-0.3.0


如果不能访问 请查看 git项目 

 https://github.com/twitter/twemproxy

 解决autoconf 问题
http://zhaohe162.blog.163.com/blog/static/3821679720147276238862/



Can't exec "aclocal"
解决办法
http://ask.xmodulo.com/fix-failed-to-run-aclocal.html



[root@node1 tools]# autoconf --version
autoconf (GNU Autoconf) 2.68
Copyright (C) 2010 Free Software Foundation, Inc.
License GPLv3+/Autoconf: GNU GPL version 3 or later
<http://gnu.org/licenses/gpl.html>, <http://gnu.org/licenses/exceptions.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by David J. MacKenzie and Akim Demaille.
[root@node1 tools]# automake
automake: `configure.ac' or `configure.in' is required
[root@node1 tools]# automake --version
automake (GNU automake) 1.11.1
Copyright (C) 2009 Free Software Foundation, Inc.
License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl-2.0.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by Tom Tromey <tromey@redhat.com>
       and Alexandre Duret-Lutz <adl@gnu.org>.


 解决 configure.ac:17: error: possibly undefined macro: AC_PROG_LIBTOOL

安装时出现configure.ac:17: error: possibly undefined macro: AC_PROG_LIBTOOL
                     If this token and others are legitimate, please use m4_pattern_allow.
                     See the Autoconf documentation.
                     autoreconf: /usr/bin/autoconf failed with exit status: 1

原来缺少一个工具：sudo apt-get install libtool  
 安装之后惊喜
之后为了保证不出错 ，还需要安装一个工具：sudo apt-get install libsysfs-dev


http://www.cnblogs.com/haoxinyue/p/redis.html
http://www.cnblogs.com/gomysql/p/4413922.html

缺点：

http://blog.csdn.net/shunlongjin/article/details/22273119
http://blog.csdn.net/shunlongjin/article/details/22273119
http://blog.csdn.net/shunlongjin/article/details/22273119