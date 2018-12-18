FROM php:7.2-apache
SHELL ["/bin/bash", "-c"]

RUN ln -s ../mods-available/{expires,headers,rewrite}.load /etc/apache2/mods-enabled/
RUN sed -e '/<Directory \/var\/www\/>/,/<\/Directory>/s/AllowOverride None/AllowOverride All/' -i /etc/apache2/apache2.conf
COPY php.ini /usr/local/etc/php/

COPY init_container.sh /usr/local/bin/
COPY .htaccess /var/www/html/
COPY test.html /var/www/html/
COPY sshd_config /tmp/sshd_config.in

COPY IdeaSpace /var/www/html/
COPY vars.php /var/www/html/

RUN echo "installing" \
    && apt update \
    && apt -y upgrade \
    && apt -y install wget openssh-server libpng-dev mysql-client dialog \
    && cp /tmp/sshd_config.in /etc/ssh/sshd_config \
    && service ssh start \
    && echo "root:Docker!" | chpasswd \
    && docker-php-ext-install gd mbstring pdo_mysql \
    && chown -R www-data:staff /var/www \
    && chmod u+x /usr/local/bin/init_container.sh \
    && curl https://vrstorygramt1.scm.azurewebsites.net/api/settings -o /var/www/html/settings.html
    

RUN /usr/local/bin/init_container.sh

RUN printenv | sed -e "s/$/'<br>/g" > /var/www/html/env.html


EXPOSE 80 2222

