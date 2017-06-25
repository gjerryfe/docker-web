FROM php:7.1-fpm

RUN echo -e "Acquire::http::Proxy \"http://10.0.0.138:8080\";" >> /etc/apt.conf


RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt pdo_mysql \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

COPY php/php.ini /usr/local/etc/php/
