FROM centos:6.6
MAINTAINER Nicola Ferraro <nibbio84@gmail.com>

RUN yum install -y java-1.7.0-openjdk.x86_64
ENV JAVA_HOME=/usr/lib/jvm/jre

RUN yum install -y wget
RUN yum install -y nc
RUN yum install -y tar

RUN mkdir /hbase-setup
WORKDIR /hbase-setup

ADD ./install-hbase.sh /hbase-setup/
RUN ./install-hbase.sh

RUN /opt/hbase/bin/hbase-config.sh

ADD hbase-site.xml /opt/hbase/conf/hbase-site.xml
ADD start-pseudo-distributed.sh /opt/hbase/bin/start-pseudo-distributed.sh

ADD http://ftp-stud.hs-esslingen.de/pub/Mirrors/ftp.apache.org/dist/phoenix/phoenix-4.6.0-HBase-1.1/bin/phoenix-4.6.0-HBase-1.1-bin.tar.gz /tmp/phoenix.tar.gz
RUN mkdir /tmp/phoenix
RUN tar xzfv /tmp/phoenix.tar.gz --strip 1 -C /tmp/phoenix
RUN cp /tmp/phoenix/phoenix-4.6.0-HBase-1.1-server.jar /opt/hbase/lib/
RUN rm -r /tmp/phoenix/
RUN rm /tmp/phoenix.tar.gz

# zookeeper
EXPOSE 2181
# HBase Master API port
EXPOSE 60000
# HBase Master Web UI
EXPOSE 60010
# Regionserver API port
EXPOSE 60020
# HBase Regionserver web UI
EXPOSE 60030

WORKDIR /opt/hbase/bin

ENV PATH=$PATH:/opt/hbase/bin

CMD /opt/hbase/bin/start-pseudo-distributed.sh
