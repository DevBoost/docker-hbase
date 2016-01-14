FROM devboost/hadoop-base
RUN apt-get install -y zookeeper-server
RUN zookeeper-server-initialize --myid=1

EXPOSE 2181

CMD ["zookeeper-server", "start-foreground"]

