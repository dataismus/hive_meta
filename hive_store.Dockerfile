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
CMD "/bin/sh start.sh"

# docker run -d --rm -p 9000:9000 -p 50070:50070 -p 8088:8088 -p 9999:9999 --name hive dataismus/hive_store