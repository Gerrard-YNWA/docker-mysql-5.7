FROM centos:7
MAINTAINER YiChao Guo <gyc.ssdut@gmail.com>

COPY import.sql run.sh /opt/mysql/

RUN yum install -y wget \
	&& wget https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm \
	&& yum install -y mysql57-community-release-el7-9.noarch.rpm \
	&& yum install -y mysql-community-server.x86_64 \
	&& rm mysql57-community-release-el7-9.noarch.rpm

COPY my.cnf /etc/

EXPOSE 3306

CMD /opt/mysql/run.sh
