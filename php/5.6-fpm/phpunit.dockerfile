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
RUN chmod 777 -R /tmp && chmod o+t -R /tmp

# crunz contjob
RUN docker-php-ext-install -j$(nproc) \
        opcache \
        sysvsem \
        zip

COPY --from=composer:1.8 /usr/bin/composer /usr/bin/composer
ENV COMPOSER_HOME /data/web/.composer
#COPY php/php.ini /usr/local/etc/php/

#RUN apt-get install -y unzip
#COPY protoc-3.12.3-linux-x86_64.zip /tmp
#RUN unzip /tmp/protoc-3.12.3-linux-x86_64.zip -d /tmp/protoc-3.12.3
#RUN mv /tmp/protoc-3.12.3/bin/protoc /usr/local/bin/protoc
#RUN mv /tmp/protoc-3.12.3/include/google /usr/local/include/
#RUN pecl install grpc
#RUN pecl install protobuf
