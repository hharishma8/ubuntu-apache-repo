FROM centos
RUN yum install epel-release -y
COPY apache.sh /root
COPY index.html /root
COPY homedecor.html /root
RUN chmod 755 /root/index.html
RUN chmod 755 /root/homedecor.html
RUN chmod 755 /root/apache.sh
RUN ./apache.sh
RUN mv -f /root/index.html /var/www/html/work
RUN mv -f /root/homedecor.html /var/www/html/work
RUN systemctl restart httpd
RUN systemctl enable httpd
