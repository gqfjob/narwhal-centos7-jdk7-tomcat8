FROM toprightgroup/narwhal-centos7:b4

MAINTAINER TRG DevOps

ADD docker /docker

ADD ansible /ansible

RUN /docker/build

RUN /usr/bin/ansible-playbook -c local /ansible/site.yml

CMD ["/docker/monit"]

EXPOSE 8080

