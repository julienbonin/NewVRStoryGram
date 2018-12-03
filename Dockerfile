FROM devilbox/php-fpm:7.4-prod

RUN isvr_version="1.1.5" \
    && apt-get update \
    && apt-get install -y --no-install-recommends openssh-server \
    && echo "root:Docker!" | chpasswd
    && echo "installing" \
    && cd /tmp/ \
    && wget https://github.com/IdeaSpaceVR/IdeaSpace/releases/download/v${isvr_version}/IdeaSpace-${isvr_version}.tar.gz \
    && tar zxvf IdeaSpace-${isvr_version}.tar.gz \
    && mv IdeaSpace${isvr_version}/* /var/www/html/ \
    && chown -R apache.apache /var/www/html/*
    
# Tweaks to give Apache/PHP write permissions to the app
chown -R www-data:staff /var/www
chown -R www-data:staff /app

EXPOSE 80
CMD ["/run.sh"]
