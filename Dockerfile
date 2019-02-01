FROM mattrayner/lamp:latest-1604-php7

SHELL ["/bin/bash", "-c"]

COPY sshd_config /tmp/sshd_config.in

COPY IdeaSpace /var/www/html/
COPY vars.php /var/www/html/

COPY run.sh /
RUN  chmod 755 /run.sh
COPY start-mysqld.sh /

RUN echo "installing" \
    && apt update \
    && apt -y install vim apt-utils wget openssh-server libpng-dev mysql-client dialog

RUN cp /tmp/sshd_config.in /etc/ssh/sshd_config 
RUN /etc/init.d/ssh restart   
RUN echo "root:Docker!" | chpasswd 
 
RUN chown -R www-data:staff /var/www 

ENV PHP_UPLOAD_MAX_FILESIZE 2048M
ENV PHP_POST_MAX_SIZE 2048M

EXPOSE 80 2222
