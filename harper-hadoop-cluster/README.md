#创建镜像harper/hadoop-cluster:8.0
$> docker build harper/hadoop-cluster:8.0 ./

#生成容器
$> docker-compose up -d

#进入hadoop-master容器
$> docker exec -ti hadoop-master /bin/bash

#首次启动
#一键启动Hadoop HA 集群 + spark集群
$> /file/start.sh

#非首次启动
#$> ./start-hadoop-spark.sh

#第三步和第四步操作和可合并成一条命令
#$> docker exec hadoop-master /file/start.sh

#测试spark word count
$> hdfs dfs -mkdir /upload
$> hdfs dfs -put test.txt /upload/   
$> spark-shell
$> sc.textFile("hdfs://mycluster/upload/test.txt").flatMap(line => line.split(" ")).map(word => (word, 1)).reduceByKey(_ + _).sortBy(_._2,false).take(10).foreach(println)