FROM composer

RUN wget https://phar.phpunit.de/phpunit-6.2.phar
RUN chmod +x phpunit-6.2.phar
RUN mv phpunit-6.2.phar /usr/local/bin/phpunit

RUN docker-php-ext-install pdo_mysql

