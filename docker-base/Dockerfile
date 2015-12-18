FROM ubuntu:14.04 

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y wget openjdk-7-jdk
RUN wget 'http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/cloudera.list' -O /etc/apt/sources.list.d/cloudera.list
ADD cloudera.pref /etc/apt/preferences.d/cloudera.pref
ADD http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/archive.key archive.key
RUN apt-key add archive.key && rm archive.key
RUN apt-get update

ADD https://github.com/ohjames/smell-baron/releases/download/v0.3.0/smell-baron /usr/bin/smell-baron

ENTRYPOINT ["smell-baron"]
