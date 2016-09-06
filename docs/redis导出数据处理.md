#linux redis 导出数据
###一、实验环境
```
	操作系统： CentoOS6  或者ubunt 
	
```



###二、ubuntu 安装:
```
1.  apt-get  upgrade 
2.  apt-get  install ruby
```
     
###三、centos 安装
```
 1.yum install ruby rubygems ruby-devel  
 gem sources --add https://ruby.taobao.org/ --remove http://rubygems.org/
 gem sources -l //查看gem 源
 
 gem install redis-dump -V
```
注意： 只有一个gem 源

### 四、测试导入导出数据

####1.导出数据
```
 redis-dump -u IP:端口号 > test.json //导出数据  
```

####导入数据

```
注意： 在导入数据的时候为了测试方便可以先flushdb 此方法生产环境禁用redis-dump 需要redis服务正常
 < test.json redis-load //导入数据  

```