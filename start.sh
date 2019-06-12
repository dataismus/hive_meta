#!/bin/sh
$HADOOP_HOME/bin/hdfs namenode -format
hadoop-daemon.sh start namenode
hadoop-daemon.sh start datanode
# $HADOOP_HOME/sbin/start-dfs.sh --config ${HADOOP_CONF_DIR}
$HADOOP_HOME/sbin/start-yarn.sh --config ${HADOOP_CONF_DIR}
$HADOOP_HOME/sbin/mr-jobhistory-daemon.sh start historyserver
 
# to keep the namenode up once format and launch processes are through!
tail -f /dev/null
# while true; do sleep 1000; done 