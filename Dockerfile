FROM oraclelinux:latest

MAINTAINER Ilyes-MAZOUZI

RUN yum -y update && yum clean all

RUN yum  install httpd -y
RUN yum install haproxy -y
RUN mkdir -p /etc/haproxy/cert/ssl/
RUN rm -f /etc/haproxy/haproxy.cfg

COPY index.html /var/www/html/
COPY mondomaine.pem /etc/haproxy/cert/ssl/

COPY haproxy.cfg /etc/haproxy/

EXPOSE 80
EXPOSE 1936
EXPOSE 443

CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]
#CMD ["haproxy", "-f", "/etc/haproxy/haproxy.cfg"]
