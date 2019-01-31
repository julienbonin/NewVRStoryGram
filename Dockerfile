FROM php:7.3-apache-stretch

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
    && apt update \
    && apt -y install apt-utils wget openssh-server libpng-dev mysql-client dialog \
    && cp /tmp/sshd_config.in /etc/ssh/sshd_config \
    && /etc/init.d/ssh start \
    && echo "root:Docker!" | chpasswd \
    && chown -R www-data:staff /var/www \
    && docker-php-ext-install gd mbstring pdo_mysql \
    && ln -s ../mods-available/{expires,headers,rewrite}.load /etc/apache2/mods-enabled/ \
    && sed -e '/<Directory \/var\/www\/>/,/<\/Directory>/s/AllowOverride None/AllowOverride All/' -i /etc/apache2/apache2.conf \
    && apachectl -k graceful
