.
+-- harper-nginx-tomcat:
|	+-- Dockerfile：创建tomcat的基础镜像，主要是安装jdk
|	+-- docker-compose.yml：生成一个nginx和三个tomcat集群
|	+-- web目录：写的web项目，连接mysql数据库用于测试读写分离和高可用
|	+-- nginx目录：存放配置文件nginx.conf
|	+-- 一键部署启动集群，将tomcat托管到nginx，访问nginx.conf的端口，实现反向代理和负载均衡
+-- harper-mysql: 
|	+-- mysqlData目录：mysql集群挂载的数据卷，里面有响应配置文件mysql.conf
|	+-- docker-compose.yml：生成mysql主从复制的容器
|	+-- 搭建mysql的主从复制集群，需进一步实现读写分离和其高可用
+-- harper-hadoop-cluster:
|	+-- Dockerfile：创建基础镜像：harper/hadoop-cluster:8.0
|	+-- docker-compose.yml：生成三个容器：hadoop-master,hadoop-slave1,hadoop-slave2
|	+-- README.md：使用说明
|	+-- file：存放hadoop、spark、zookeeper等的配置文件，由Dockerfile创建镜像时导入
|	|	+-- 软件安装所需的包：
|	|	|	+-- hadoop-2.7.3.tar.gz
|	|	|	+-- jdk-8u91-linux-x64.rpm
|	|	|	+-- scala-2.12.8.tgz
|	|	|	+-- spark-2.4.3-bin-hadoop2.7.tgz
|	|	|	- zookeeper-3.4.6.tar.gz
|	|	+-- ssh_config：用于免密登录，由Dockerfile创建镜像时导入
|	|	+-- start.sh：容器生成以后一键启动Hadoop HA集群以及spark集群的脚本
|	+-- 一键搭建并启动Hadoop HA集群和spark集群，配合ssh免密登录zookeeper集群等等
+-- 技术文档：详细步骤，具体如何实现
+-- 进度报告：大体每天的工作
