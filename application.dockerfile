FROM php:7.2-fpm
   
RUN export DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y libmcrypt-dev \
     default-mysql-client libmagickwand-dev --no-install-recommends
RUN pecl install mcrypt-1.0.1
RUN docker-php-ext-enable mcrypt
RUN docker-php-ext-install pdo_mysql

# Install Composer
RUN curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
#RUN composer install --dry-run
#RUN composer dump-autoload
#RUN composer update --dry-run