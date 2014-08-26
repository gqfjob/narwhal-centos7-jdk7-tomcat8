FROM toprightgroup/narwhal-centos7:b4

MAINTAINER TRG DevOps

ADD docker /docker

ADD ansible /ansible

# Build require software
RUN /docker/build

# Add TRG webapps
ADD webapps /opt/tomcat/webapps

# Configure exposed variables
RUN /usr/bin/ansible-playbook -c local /ansible/site.yml

CMD ["/docker/monit"]

EXPOSE 8080

