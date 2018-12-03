FROM devilbox/php-fpm:7.4-prod

ADD ./run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 80 443 2222
CMD ["/run.sh"]
