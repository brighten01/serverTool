#Rabbitmq HA搭建文档

###一、软件准备
```
centos 6.4 以上yum源 尽量保持最新
rabbitmq 3.2
erlang 16B03(erlang 1.5)

```

一、安装前必要准备
```
yum -y install make ncurses-devel gcc gcc-c++ unixODBC unixODBC-devel openssl openssl-devel

```
二、安装软件
1.安装erlang 

```
wget http://www.erlang.org/download/otp_src_R16B02.tar.gz
cd opt_src_R16B02
./configure --prefix=/usr/local/erlang
 make && make install
 
 配置环境变量

	 ERL_HOME=/usr/local/erlang
     PATH=$ERL_HOME/bin:$PATH 
     export ERL_HOME PATH
```

2.安装rabbitmq 

```
http://www.rabbitmq.com/releases/rabbitmq-server/v3.2.0/rabbitmq-server-3.2.0-1.noarch.rpm

rpm -i --nodeps rabbitmq-server-3.2.0-1.noarch.rpm
```
>注意：如果直接用rpm -i rabbitmq-server-3.2.0-1.noarch.rpm，会提示缺少erlang 13B的环境，前面安装了erlang 15B02所以 加上--nodeps则能安装成功。


3.启动rabbitmq-server 
```
rabbitmq-server start 
停止
rabbitmqctl stop

```


>如果出现错误，考虑将运行
```
chmod -R 777  				     /var/lib/rabbitmq/mnesia/rabbit@localhost/
```

一些额外的操作 

```
ping 各个节点
在各个节点上运行 service iptables stop

```
另外：

```python
开启 manage 功能 
sudo rabbitmq-plugins enable rabbitmq_management
rabbitmq有个默认的监控系统 默认端口是 15672 
ip:15672 
用户名： guest
密码:  guest

```
![Alt text](./management1.png)

三、开始配置安装

1. 节点规划
```
 node1 192.168.248.128
 node2 192.168.248.129
 node3 192.168.248.130
 proxy代理节点 ： 192.168.248.131
```
2.拷贝文件到各个节点： .erlang.cookie

>注意：/var/lib/rabbitmq	/.erlang.cookie 文件是rabbitmq启动生成的cookie文件 权限 400 不可改成777 否则将报错
```
{error_logger,{{2016,8,7},{23,18,42}},"Cookie file /var/lib/rabbitmq/.erlang.cookie must be accessible by owner only",[]
```

>虚拟机克隆所以不用拷贝/var/lib/erlang.cookie 如果是单独的服务器需要拷贝对应的 cookie文件

3.在node2 node3 节点上 执行操作如下

```
在 node2. node3 节点分别执行

node2 # rabbitmqctl stop_app 
node2 # rabbitmqctl join_cluster rabbit@node1
node2 # rabbitmqctl start_app
node3 # rabbitmqctl stop_app 
node3 # rabbitmqctl join_cluster rabbit@node1
node3 # rabbitmqctl start_app
```
```
部分执行结果如下：

Cluster status of node rabbit@node3 ...
[{nodes,[{disc,[rabbit@node1,rabbit@node2,rabbit@node3]}]},
 {running_nodes,[rabbit@node1,rabbit@node2,rabbit@node3]},
 {partitions,[]}]



[root@node3 ~]# rabbitmqctl stop_app
Stopping node rabbit@node3 ...
...done.
[root@node3 ~]# rabbitmqctl  join_cluster rabbit@node1
Clustering node rabbit@node3 with rabbit@node1 ...
...done.
[root@node3 ~]# rabbitmqctl start_app
Starting node rabbit@node3 ...
...done.
[root@node3 ~]# rabbitmqctl set_policy ha-all "^" '{"ha-mode":"all"}'
Setting policy "ha-all" for pattern "^" to "{\"ha-mode\":\"all\"}" with priority "0" ...
...done.
```


4.以上已经安装好cluster 现在需要haproxy 配置  负载均衡器 

```powershell
listen rabbitmq_cluster 0.0.0.0:5672
 
mode tcp
balance roundrobin
 
server   node1 192.168.1.1:5672 check inter 2000 rise 2 fall 3  
server   node2 192.168.1.2:5672 check inter 2000 rise 2 fall 3
server   node2 192.168.1.3:5672 check inter 2000 rise 2 fall 3
```

四、rabbitmq维护相关

一些指令用法

```
一步启动Erlang node和Rabbit应用：./rabbitmq-server
在后台启动Rabbit node：./rabbitmq-server -detached
关闭整个节点（包括应用）：./rabbitmqctl stop 
因为rabbitmq-server一起启动了节点和应用，它预先设置RabbitMQ应用为standalone模式。要将一个节点加入到现有的集群中，你需要停止这个应用并将节点设置为原始状态，然后就为加入集群准备好了。如果使用./rabbitmqctl stop，应用和节点都将被关闭。所以，

仅仅关闭应用：./rabbitmqctl stop_app

类似的： ./rabbitmqctl start_app 用来启动应用
管理相关
http://my.oschina.net/fhd/blog/375620
```