#jekins 环境搭建

```
	centos 6.5
	gcc 4.4.7
	maven  Apache Maven 3.3.9 
	ant 1.9.7
	tomcat  7.0.65 
	jdk 1.8
```

####一、安装jdk
```
		下载网址 ：http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
		本例主要采用jdk1.8来配置安装			
```

####二、安装tomcat
		
	```
			 下载tomcat7.0.65 7.0.70 会有问题 bin目录下面没有对应 bootstrap.jar tomcat-juli.jar
		地址：http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.65/
		wget http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.65/bin/apache-tomcat-7.0.65.tar.gz


####配置 maven
```
wget http://mirrors.cnnic.cn/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
解压后复制到 /data/tools/maven
MAVEN_HOME=/data/tools/maven
PATH=${MAVEN_HOME}/bin:${PATH}	
```



####配置ant
```
wget http://mirror.bit.edu.cn/apache//ant/binaries/apache-ant-1.9.7-bin.tar.gz
解压后复制到 /data/tools/apache-ant
ANT_HOME=/data/tools/apache-ant
export PATH=${PATH}:${ANT_HOME}/bin
```

####三、配置jdk和tomcat maven 和 jenkins后对应的profile可能是

```powershell
	vim /etc/profile
	JAVA_HOME=/data/tools/jdk1.8
 PATH=$JAVA_HOME/bin:$PATH
 #CLASSPATH=$JAVA_HOME/jre/lib/ext:$JAVA_HOME/lib/tools.jar
 CLASSPATH=.:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar
 CATALINA_HOME=/data/tools/tomcat7
 CATALINA_BASE=/data/tools/tomcat7
JENKINS_HOME=/data/tools/tomcat7/webapps/jenkins
MAVEN_HOME=/data/tools/maven
PATH=${MAVEN_HOME}/bin:${PATH}
ANT_HOME=/data/tools/apache-ant
export PATH=${PATH}:${ANT_HOME}/bin
export JAVA_HOME  CLASSPATH  CATALINA_BASE CATALINA_HOME JENKINS_HOME  MAVEN_HOME  ANT_HOME  PATH
	
	生效：
	source /etc/profile
	
```

![Alt text](./tomcat.png)

####三、安装jenkins
下载时候直接点击按钮下载.war文件  或者下载 rpm包

```
	拷贝.war 文件到 /data/tools/tomcat7/webapps 并且重启服务
	catalina.sh stop 
	catalina.sh start
	访问jenkins   ip:8080/jenkins 出现如下图安装页面
```

![Alt text](./jekins_install.png)


####四、配置jekins服务

```	
	重启tomcat7之后 会在 /tomcat7路径/webapps 下生成网站，安装完成后 设置用户名密码进入即可

```

