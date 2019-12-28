FROM centos

MAINTAINER Harper Cheung <harper.cheung@qq.com>

WORKDIR  /usr/local

ADD apache-tomcat-8.5.43.tar.gz /usr/local


#安装java
ADD jdk-8u101-linux-x64.tar.gz /usr/local/ 

COPY server.xml /usr/local/apache-tomcat-8.5.43/conf/server.xml
 
#设置环境变量
ENV JAVA_HOME /usr/local/jdk1.8.0_101
ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV CATALINA_HOME /usr/local/apache-tomcat-8.5.43
ENV PATH $PATH:$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$CATALINA_HOME/lib:$CATALINA_HOME/bin
 
EXPOSE 8080
ENTRYPOINT ["/usr/local/apache-tomcat-8.5.43/bin/catalina.sh", "run"]