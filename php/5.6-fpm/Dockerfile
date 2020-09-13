#FROM php:5.6-fpm-jessie
FROM php:5.6-fpm

RUN echo -e "Acquire::http::Proxy \"http://10.0.0.136:8118\";" >> /etc/apt.conf

COPY php/prod-php.ini /usr/local/etc/php/php.ini

COPY phpunit-5.7.27.phar /usr/local/bin/phpunit
CMD chmod +x /usr/local/bin/phpunit

RUN apt-get update && apt-get install -y \
        vim \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt pdo_mysql mysqli mysql zlib zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

RUN pecl install apcu-4.0.11 \
    && echo extension=apcu.so > /usr/local/etc/php/conf.d/apcu.ini

#COPY php/php.ini /usr/local/etc/php/
