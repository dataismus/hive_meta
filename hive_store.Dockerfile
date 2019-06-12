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

# EXPOSE 9870

# ALWAYS chmod +x shell scripts before COPY!
RUN mkdir $HADOOP_HOME/logs && chmod 777 $HADOOP_HOME/logs
COPY start.sh /
CMD "/start.sh"

# ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64/
# ENV PATH $PATH:${JAVA_HOME}/bin:/usr/lib/jvm/java-11-openjdk-amd64/bin

# docker run -it --rm -p 9000:9000 -p 50070:50070 -p 8088:8088  \
# -p 9999:9999 --name=hadoop --hostname=master dataismus/hive_store