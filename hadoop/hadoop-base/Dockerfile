FROM adoptopenjdk/openjdk8:debianslim-jre


ENV  DEBIAN_FRONTEND noninteractive

ENV  HADOOP_VERSION 3.2.2
ENV  HADOOP_INSTALL_DIR /opt/hadoop

# init base os
#RUN sed -i "s/httpredir.debian.org/mirrors.163.com/g" /etc/apt/sources.list
RUN  apt-get update && \
     apt-get install -y --no-install-recommends curl tar ssh && \
     apt-get clean autoclean && \
     apt-get autoremove --yes && \
     rm -rf /var/lib/{apt,dpkg,cache,log}/

# download hadoop
RUN  mkdir -p ${HADOOP_INSTALL_DIR} && \
     curl -L https://apache.mediamirrors.org/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz | tar -xz --strip=1 -C ${HADOOP_INSTALL_DIR}

# Enable jmx by default
WORKDIR  ${HADOOP_INSTALL_DIR}

RUN echo "# Extra Java runtime options. Empty by default." >> ${HADOOP_INSTALL_DIR}/etc/hadoop/hadoop-env.sh && \
    echo "export HADOOP_OPTS=\"-Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false\"" >> ${HADOOP_INSTALL_DIR}/etc/hadoop/hadoop-env.sh && \
    echo "# Command specific options appended to HADOOP_OPTS when specified" >> ${HADOOP_INSTALL_DIR}/etc/hadoop/hadoop-env.sh && \
    echo "export HADOOP_NAMENODE_OPTS=\"-Dcom.sun.management.jmxremote \$HADOOP_NAMENODE_OPTS -Dcom.sun.management.jmxremote.port=8004\"" >> ${HADOOP_INSTALL_DIR}/etc/hadoop/hadoop-env.sh && \
    echo "export HADOOP_SECONDARYNAMENODE_OPTS=\"-Dcom.sun.management.jmxremote \$HADOOP_SECONDARYNAMENODE_OPTS -Dcom.sun.management.jmxremote.port=8005\"" >> ${HADOOP_INSTALL_DIR}/etc/hadoop/hadoop-env.sh && \
    echo "export HADOOP_DATANODE_OPTS=\"-Dcom.sun.management.jmxremote \$HADOOP_DATANODE_OPTS -Dcom.sun.management.jmxremote.port=8006\"" >> ${HADOOP_INSTALL_DIR}/etc/hadoop/hadoop-env.sh && \
    echo "export HADOOP_BALANCER_OPTS=\"-Dcom.sun.management.jmxremote \$HADOOP_BALANCER_OPTS -Dcom.sun.management.jmxremote.port=8007\"" >> ${HADOOP_INSTALL_DIR}/etc/hadoop/hadoop-env.sh && \
    echo "export HADOOP_JOBTRACKER_OPTS=\"-Dcom.sun.management.jmxremote \$HADOOP_JOBTRACKER_OPTS -Dcom.sun.management.jmxremote.port=8008\"" >> ${HADOOP_INSTALL_DIR}/etc/hadoop/hadoop-env.sh && \
    echo "export HADOOP_TASKTRACKER_OPTS=\"-Dcom.sun.management.jmxremote.port=8009\"" >> ${HADOOP_INSTALL_DIR}/etc/hadoop/hadoop-env.sh
