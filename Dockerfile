#Download base image - centos latest
FROM centos:latest

RUN yum update -y
RUN yum install -y install epel-release
RUN yum install -y ntpd
RUN chkconfig ntpd on
RUN service ntpd start

EXPOSE 123 22