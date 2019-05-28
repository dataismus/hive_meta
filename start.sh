#!/bin/sh
$HADOOP_HOME/bin/hdfs namenode -format
$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh

$HADOOP_HOME/bin/hdfs dfs -mkdir -p /root/hive/warehouse
# while true; do sleep 1000; done # to keep the namenode up once format and launch processes are through!