#!/bin/bash

docker-compose up -d 

docker exec hadoop-master start-dfs.sh
docker exec hadoop-master hdfs namenode -format
docker exec hadoop-master scp -r /root/hdfs/namenode/current root@hadoop-slave1:/root/hdfs/namenode/
docker exec hadoop-master stop-dfs.sh
docker exec hadoop-master start-all.sh
docker exec hadoop-master start-spark-all.sh
