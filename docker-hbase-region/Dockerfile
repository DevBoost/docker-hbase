FROM docker-registry.devboost.de/hadoop-base
RUN apt-get install -y hbase-regionserver

ADD filter.jar /opt/hbase/lib/filter.jar

ADD hbase-site.xml /etc/hbase/conf/hbase-site.xml

CMD ["hbase", "regionserver", "start"]

EXPOSE 60020
EXPOSE 60030
