#FROM mattrayner/lamp:latest-1604-php7
#FROM devilbox/php-fpm:7.4-prod

FROM php:apache
SHELL ["/bin/bash", "-c"]

RUN ln -s ../mods-available/{expires,headers,rewrite}.load /etc/apache2/mods-enabled/
RUN sed -e '/<Directory \/var\/www\/>/,/<\/Directory>/s/AllowOverride None/AllowOverride All/' -i /etc/apache2/apache2.conf
#COPY php.ini /usr/local/etc/php/

COPY init_container.sh /tmp/
COPY .htaccess /var/www/html/
COPY test.html /var/www/html/

RUN isvr_version="1.1.5" \
    && echo "installing" \
    && apt update \
    && apt -y upgrade \
    && apt -y install wget openssh-server \
    && cd /tmp/ \
    && echo curl https://github.com/IdeaSpaceVR/IdeaSpace/releases/download/v${isvr_version}/IdeaSpace-${isvr_version}.tar.gz -o IdeaSpace-${isvr_version}.tar.gz \
    && echo tar zxvf IdeaSpace-${isvr_version}.tar.gz \
    && echo mv IdeaSpace-${isvr_version}/* /var/www/html/ \
    && chown -R www-data:staff /var/www \
    && chmod a+x /tmp/init_container.sh 
    
COPY sshd_config /etc/ssh/sshd_config

RUN /tmp/init_container.sh 

#RUN kill -HUP $(pgrep sshd)

EXPOSE 80 443 2222

