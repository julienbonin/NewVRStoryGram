FROM devilbox/php-fpm:7.4-prod


COPY init_container.sh /tmp/
COPY .htaccess /var/www/html/
COPY test.html /var/www/html/

RUN isvr_version="1.1.5" \
    && apt-get update \
    && apt-get install -y --no-install-recommends openssh-server wget  \
    && echo "root:Docker!" | chpasswd \
    && echo "installing" \
    && cd /tmp/ \
    && wget https://github.com/IdeaSpaceVR/IdeaSpace/releases/download/v${isvr_version}/IdeaSpace-${isvr_version}.tar.gz \
    && tar zxvf IdeaSpace-${isvr_version}.tar.gz \
    && mv IdeaSpace-${isvr_version}/* /var/www/html/ \
    && chown -R www-data:staff /var/www \
    && chmod a+x /tmp/init_container.sh \
    && /tmp/init_container.sh 
    
COPY sshd_config /etc/ssh/sshd_config

#RUN kill -HUP $(pgrep sshd)

EXPOSE 80 443 2222

