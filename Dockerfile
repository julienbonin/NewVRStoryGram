FROM 7.3-apache-stretch

SHELL ["/bin/bash", "-c"]

# RUN 
# RUN 
#COPY php.ini /etc/php/
#RUN env > env.txt
COPY init_container.sh /usr/local/bin/
COPY .htaccess /var/www/html/
COPY test.html /var/www/html/
COPY sshd_config /tmp/sshd_config.in

COPY IdeaSpace /var/www/html/
COPY vars.php /var/www/html/

RUN echo "installing" \
    && apt -y install apt-utils wget openssh-server libpng-dev mysql-client dialog \
    && cp /tmp/sshd_config.in /etc/ssh/sshd_config \
    && echo "root:Docker!" | chpasswd \
    && chown -R apache.apache /var/www 
