
#sudo docker build --no-cache -f phpunit.dockerfile -t gjerryfe/web:php-fpm-5.6-phpunit-dev .

# add php redis with same docker image

#sudo docker build --build-arg HTTPS_PROXY=$https_proxy --build-arg HTTPS_PROXY=$http_proxy --no-cache -f php-fpm.dockerfile -t gjerryfe/web:php-fpm-5.6-dev1 .

sudo docker build --build-arg HTTPS_PROXY=$https_proxy --build-arg HTTPS_PROXY=$http_proxy --no-cache -f phpunit.dockerfile -t gjerryfe/web:php-fpm-5.6-phpunit-dev .
