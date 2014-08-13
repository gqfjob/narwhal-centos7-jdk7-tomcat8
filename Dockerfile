FROM toprightgroup/narwhal-centos7:b1

MAINTAINER TRG DevOps

ADD docker /docker

RUN /docker/build

CMD ["/docker/monit"]

EXPOSE 8080

ADD webapp /opt/tomcat/webapps
