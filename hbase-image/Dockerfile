FROM adoptopenjdk/openjdk8:debianslim-jre


ENV HBASE_VERSION 2.3.4
ENV HBASE_INSTALL_DIR /opt/hbase

#ENV JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64

RUN mkdir -p ${HBASE_INSTALL_DIR} && \
    curl -L https://mirrors.tuna.tsinghua.edu.cn/apache/hbase/${HBASE_VERSION}/hbase-${HBASE_VERSION}-bin.tar.gz | tar -xz --strip=1 -C ${HBASE_INSTALL_DIR}


ADD hbase-site.xml /opt/hbase/conf/hbase-site.xml
ADD core-site.xml /opt/hbase/conf/core-site.xml
ADD hdfs-site.xml /opt/hbase/conf/hdfs-site.xml
ADD start-k8s-hbase.sh /opt/hbase/bin/start-k8s-hbase.sh
RUN chmod +x /opt/hbase/bin/start-k8s-hbase.sh

WORKDIR ${HBASE_INSTALL_DIR}
RUN echo "export HBASE_JMX_BASE=\"-Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false\"" >> conf/hbase-env.sh && \
    echo "export HBASE_MASTER_OPTS=\"\$HBASE_MASTER_OPTS \$HBASE_JMX_BASE -Dcom.sun.management.jmxremote.port=10101\"" >> conf/hbase-env.sh && \
    echo "export HBASE_REGIONSERVER_OPTS=\"\$HBASE_REGIONSERVER_OPTS \$HBASE_JMX_BASE -Dcom.sun.management.jmxremote.port=10102\"" >> conf/hbase-env.sh && \
    echo "export HBASE_THRIFT_OPTS=\"\$HBASE_THRIFT_OPTS \$HBASE_JMX_BASE -Dcom.sun.management.jmxremote.port=10103\"" >> conf/hbase-env.sh && \
    echo "export HBASE_ZOOKEEPER_OPTS=\"\$HBASE_ZOOKEEPER_OPTS \$HBASE_JMX_BASE -Dcom.sun.management.jmxremote.port=10104\"" >> conf/hbase-env.sh && \
    echo "export HBASE_REST_OPTS=\"\$HBASE_REST_OPTS \$HBASE_JMX_BASE -Dcom.sun.management.jmxremote.port=10105\"" >> conf/hbase-env.sh

ENV PATH=$PATH:/opt/hbase/bin

CMD /opt/hbase/bin/start-k8s-hbase.sh
