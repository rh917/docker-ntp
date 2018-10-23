FROM centos:latest

# install ntp
RUN yum install -y ntp

# use custom ntpd config file
COPY assets/ntpd.conf /etc/ntpd.conf

# ntp port
EXPOSE 123/udp

# start ntpd in the foreground
# ENTRYPOINT [ "/usr/sbin/ntpd" ]
ENTRYPOINT ["/usr/sbin/ntpd"] & CMD ["-D", "FOREGROUND"] 