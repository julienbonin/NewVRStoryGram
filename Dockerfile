FROM php:apache
SHELL ["/bin/bash", "-c"]

RUN ln -s ../mods-available/{expires,headers,rewrite}.load /etc/apache2/mods-enabled/
RUN sed -e '/<Directory \/var\/www\/>/,/<\/Directory>/s/AllowOverride None/AllowOverride All/' -i /etc/apache2/apache2.conf
COPY php.ini /usr/local/etc/php/

COPY init_container.sh /usr/local/bin/
COPY .htaccess /var/www/html/
COPY test.html /var/www/html/

RUN isvr_version="1.1.5" \
    && echo "installing" \
    && apt update \
    && apt -y upgrade \
    && apt -y install wget openssh-server libpng-dev mysql-client dialog \
    && echo "root:Docker!" | chpasswd \
    && docker-php-ext-install gd mbstring mysqli pdo_mysql \
    && chown -R www-data:staff /var/www \
    && chmod u+x /usr/local/bin/init_container.sh \
    && curl https://vrstorygramt1.scm.azurewebsites.net/api/settings -o /var/www/html/settings.html
    
COPY sshd_config /etc/ssh/sshd_config

COPY IdeaSpace /var/www/html/
COPY vars.php /var/www/html/

RUN printenv | sed -e "s/$/'<br>/g" > /var/www/html/env.html

ENTRYPOINT ["/usr/local/bin/init_container.sh"]

EXPOSE 80 2222

