FROM centos
RUN yum install epel-release -y
COPY apache.sh /root
COPY index.html /root
RUN chmod 755 /root/index.html
RUN chmod 755 /root/apache.sh
RUN mv -f /root/index.html /var/www/html/work
RUN systemctl enable httpd