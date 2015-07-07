FROM centos:7

MAINTAINER Charlie Pence 

ENV KAFKA_VERSION="0.8.2.1" SCALA_VERSION="2.10"

RUN yum -y update && yum install -y unzip java-1.7.0-openjdk-devel docker.io jq wget curl git net-tools

ADD download-kafka.sh /tmp/download-kafka.sh
RUN /tmp/download-kafka.sh
RUN tar xf /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -C /opt

VOLUME ["/kafka"]

ENV KAFKA_HOME /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}
ADD start-kafka.sh /usr/bin/start-kafka.sh
ADD broker-list.sh /usr/bin/broker-list.sh
CMD start-kafka.sh
