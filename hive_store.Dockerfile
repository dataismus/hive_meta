FROM dataismus/base_node


# Hadoop/yarn config ===============================================
COPY core-site.xml ${HADOOP_CONF_DIR}/core-site.xml
COPY yarn-site.xml ${HADOOP_CONF_DIR}/yarn-site.xml
COPY hdfs-site.xml ${HADOOP_CONF_DIR}/hdfs-site.xml
COPY mapred-site.xml ${HADOOP_CONF_DIR}/mapred-site.xml
COPY hive-env.sh ${HIVE_HOME}/conf/hive-env.sh
# COPY slaves ${HADOOP_CONF_DIR}/slaves

ENV CLASSPATH $CLASSPATH:${HADOOP_HOME}/lib/*:.
ENV CLASSPATH $CLASSPATH:${HIVE_HOME}/lib/*:.

# ALWAYS chmod +x shell scripts before COPY!
COPY start.sh /