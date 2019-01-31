FROM php:7.3-apache-stretch

SHELL ["/bin/bash", "-c"]

# RUN 
# RUN 
#COPY php.ini /etc/php/
RUN env > env.txt
COPY init_container.sh /usr/local/bin/
COPY .htaccess /var/www/html/
COPY php.ini /usr/local/php/etc/
COPY test.html /var/www/html/
COPY sshd_config /tmp/sshd_config.in

COPY IdeaSpace /var/www/html/
COPY vars.php /var/www/html/

RUN echo "installing" \
    && apt update \
    && apt -y install vim apt-utils wget openssh-server libpng-dev mysql-client dialog

RUN cp /tmp/sshd_config.in /etc/ssh/sshd_config 
RUN /etc/init.d/ssh restart   
RUN echo "root:Docker!" | chpasswd 
 
RUN chown -R www-data:staff /var/www 

RUN docker-php-ext-install gd 
RUN docker-php-ext-install mbstring 
RUN docker-php-ext-install pdo_mysql

RUN ln -s ../mods-available/{expires,headers,rewrite}.load /etc/apache2/mods-enabled/
RUN sed -e '/<Directory \/var\/www\/>/,/<\/Directory>/s/AllowOverride None/AllowOverride All/' -i /etc/apache2/apache2.conf
RUN apachectl -k graceful

EXPOSE 80 2222
