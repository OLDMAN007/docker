#!/bin/bash

hdfs zkfc -formatZK
start-dfs.sh
hdfs namenode -format
scp -r /root/hdfs/namenode/current/ root@hadoop-slave1:/root/hdfs/namenode/
stop-dfs.sh
start-all.sh
start-spark-all.sh
