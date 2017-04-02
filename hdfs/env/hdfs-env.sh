

RUN adduser hadoop && \
mkdir -p /opt/yarn/nm && \
mkdir -p /var/log/hadoop-yarn && \
chown -R hadoop:hadoop /usr/local/hadoop && \
chown hadoop:hadoop /opt/yarn/nm && \
chown hadoop:hadoop /var/log/hadoop-yarn

export HA=yes
export NAMESERVICE=dcnameservice

export ACTIVE_NAMENODE_IP="namenode-01.hdfs.fpt.net"
export STANDBY_NAMENODE_IP="namenode-02.hdfs.fpt.net"

export ACTIVE_NAMENODE_ID="namenode-01"
export STANDBY_NAMENODE_ID="namenode-02"

export HA_ZOOKEEPER_QUORUM="zk-jn-01.fpt.net:2181,zk-jn-02.fpt.net:2181,zk-namenode-01.fpt.net.net:2181,zk-namenode-02.fpt.net:2181,zk-yarn-01.fpt.net:2181,zk-yarn-02.fpt.net:2181,zk-01.fpt.net:2181"

export YARN_ZK_DIR="yarn1"
export YARN_CLUSTER_ID="yarn1"
export YARN_RM1_IP="yarn1-rm1.fpt.net"
export YARN_RM2_IP="yarn1-rm2.fpt.net"
export YARN_JOBHISTORY_IP="yarn1-rm1.fpt.net"
export NAMENODE_IP="172.16.31.63"
export RESOURCEMANAGER_IP="172.16.31.63"

export HADOOP_HOME /usr/local/hadoop
export PATH "/usr/local/hadoop/bin:/usr/local/hadoop/sbin:$PATH"
export HADOOP_CONF_DIR $HADOOP_HOME/etc/hadoop
export YARN_CONF_DIR $HADOOP_HOME/etc/hadoop
export CPU_CORE_NUM 4
export NODEMANAGER_MEMORY_MB 8192

#
echo "export HADOOP_HOME=/usr/local/hadoop" >> /etc/profile
echo "export HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop" >> /etc/profile
echo "export YARN_CONF_DIR=/usr/local/hadoop/etc/hadoop" >> /etc/profile
echo "PATH=${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin:${SPARK_HOME}/bin:${PATH}" >> /etc/profile
echo "CLASSPATH=.:${JAVA_HOME}/lib/dt.jar:${JAVA_HOME}/lib/tools.jar" >> /etc/profile


ADD scripts/startup.sh /usr/bin/

ADD ./lib/* /usr/local/hadoop/lib/native/

ENTRYPOINT ["startup.sh"]
#You can pass new args to startup.sh,support resourcemanager or nodemanager
CMD ["nodemanager"]



