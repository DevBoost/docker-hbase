FROM ubuntu:14.04 

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update --fix-missing
RUN apt-get install -y wget openjdk-7-jdk
RUN wget 'http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/cloudera.list' -O /etc/apt/sources.list.d/cloudera.list
ADD cloudera.pref /etc/apt/preferences.d/cloudera.pref
ADD http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/archive.key archive.key
RUN apt-key add archive.key && rm archive.key
RUN apt-get update

RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.0.0/dumb-init_1.0.0_amd64
RUN chmod +x /usr/local/bin/dumb-init

ENTRYPOINT ["dumb-init"]
