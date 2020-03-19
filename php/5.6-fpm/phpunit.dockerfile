FROM gjerryfe/web:php-fpm-5.6-dev

COPY phpunit-5.7.27.phar /usr/local/bin/phpunit
RUN chmod +x /usr/local/bin/phpunit


# php-redis
RUN mkdir -p /data/src/
RUN curl -L -o /data/src/redis.tar.gz https://github.com/phpredis/phpredis/archive/3.1.3.tar.gz
RUN tar xfz /data/src/redis.tar.gz
RUN rm -r /data/src/redis.tar.gz
RUN mkdir -p /usr/src/php/ext
RUN mv phpredis-3.1.3 /usr/src/php/ext/redis
RUN docker-php-ext-install redis
