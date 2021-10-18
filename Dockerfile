FROM ubuntu

# File Author / Maintainer
MAINTAINER hharishma

# Update the repository sources list
RUN apt-get update

# Install and run apache
RUN apt-get install -y apache2 && apt-get clean

#ENTRYPOINT ["/usr/sbin/apache2", "-k", "start"]


#ENV APACHE_RUN_USER www-data
#ENV APACHE_RUN_GROUP www-data
#ENV APACHE_LOG_DIR /var/log/apache2
COPY apache.sh /root
COPY index.html /root
RUN chmod 755 /root/index.html
RUN chmod 755 /root/apache.sh
RUN mv -f /root/index.html /var/www/html/work

EXPOSE 80
CMD apachectl -D FOREGROUND
