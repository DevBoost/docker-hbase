FROM docker-registry.devboost.de/hadoop-base
RUN apt-get install -y hbase-master
ADD hbase-site.xml /etc/hbase/conf/hbase-site.xml

ADD filter.jar /opt/hbase/lib/filter.jar

CMD ["hbase", "master", "start"]

EXPOSE 60000
EXPOSE 60010
