FROM docker-registry.devboost.de/hadoop-base
RUN apt-get install -y hbase-regionserver

ADD filter.jar /opt/hbase/lib/filter.jar
ADD filter.jar /opt/hbase/bin/filter.jar
ADD filter.jar /usr/lib/hbase/filter.jar
ADD filter.jar /usr/lib/hbase/lib/filter.jar
ADD filter.jar /usr/share/java/filter.jar

ENV HBASE_CLASSPATH=/usr/share/java/filter.jar

ADD hbase-site.xml /etc/hbase/conf/hbase-site.xml

CMD ["hbase", "regionserver", "start"]

EXPOSE 60020
EXPOSE 60030
