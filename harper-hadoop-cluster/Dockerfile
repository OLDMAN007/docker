
FROM centos

MAINTAINER Harper Cheung <harper.cheung@qq.com>

WORKDIR /root

COPY file/* /file/

# install jdk 1.8
RUN rpm -ivh /file/jdk-8u91-linux-x64.rpm

# install hadoop 2.7.3
RUN tar -zxvf /file/hadoop-2.7.3.tar.gz -C /usr/local

#install zookeeper 3.4.6
RUN tar -zxvf /file/zookeeper-3.4.6.tar.gz -C /usr/local

#install scala 2.12.8
RUN tar -xvf /file/scala-2.12.8.tgz -C /usr/local

#install spark 2.4.3
RUN tar -xvf /file/spark-2.4.3-bin-hadoop2.7.tgz -C /usr/local

# set environment for java hadoop scala spark zookeeper
ENV JAVA_HOME=/usr/java/jdk1.8.0_91
ENV CLASSPATH=.:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH=$PATH:$JAVA_HOME/bin
ENV HADOOP_HOME=/usr/local/hadoop-2.7.3
ENV HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
ENV HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/native"
ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
ENV SCALA_HOME=/usr/local/scala-2.12.8
ENV PATH=$PATH:$SCALA_HOME/bin
ENV SPARK_HOME=/usr/local/spark-2.4.3-bin-hadoop2.7
ENV PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin
ENV ZOOKEEPER_HOME=/usr/local/zookeeper-3.4.6
ENV PATH=$PATH:$ZOOKEEPER_HOME/bin

RUN mkdir -p /root/hdfs/namenode && \ 
    mkdir -p /root/hdfs/datanode && \
    mkdir $HADOOP_HOME/logs && \
    mkdir $ZOOKEEPER_HOME/data && \
    mkdir $ZOOKEEPER_HOME/logs

RUN yum update -y && \
    yum install -y openssh-server openssh-clients which psmisc

# ssh without key
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

RUN mv /file/ssh_config /etc/ssh/
ADD file/hadoop/hadoop-env.sh $HADOOP_HOME/etc/hadoop
ADD file/hadoop/hdfs-site.xml $HADOOP_HOME/etc/hadoop
ADD file/hadoop/core-site.xml $HADOOP_HOME/etc/hadoop
ADD file/hadoop/mapred-site.xml $HADOOP_HOME/etc/hadoop
ADD file/hadoop/yarn-site.xml $HADOOP_HOME/etc/hadoop
ADD file/hadoop/slaves $HADOOP_HOME/etc/hadoop
ADD file/zookeeper/zoo.cfg $ZOOKEEPER_HOME/conf
#ADD file/zookeeper/slave2/myid $ZOOKEEPER_HOME/data
ADD file/spark/slaves $SPARK_HOME/conf
ADD file/spark/spark-env.sh $SPARK_HOME/conf
RUN mv $SPARK_HOME/sbin/start-all.sh $SPARK_HOME/sbin/start-spark-all.sh
RUN mv $SPARK_HOME/sbin/stop-all.sh $SPARK_HOME/sbin/stop-spark-all.sh

RUN chmod +x /file/start.sh && \
    chmod +x $HADOOP_HOME/sbin/start-dfs.sh && \
    chmod +x $HADOOP_HOME/sbin/start-yarn.sh

CMD [ "sh", "-c", "systemctl start sshd; bash"]
