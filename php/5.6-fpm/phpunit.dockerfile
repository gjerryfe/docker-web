FROM gjerryfe/web:php-fpm-5.6-dev

COPY phpunit-5.7.27.phar /usr/local/bin/phpunit
RUN chmod +x /usr/local/bin/phpunit
