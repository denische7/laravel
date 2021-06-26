FROM php:7.4-apache

COPY php.ini /usr/local/etc/php/php.ini

ENV TERM xterm

RUN a2enmod rewrite

# Change apache virtual host
COPY default-virtual-host.conf /etc/apache2/sites-enabled/000-default.conf

RUN apt-get update \
    && apt-get install -y \
        libpng-dev \
        libzip-dev \
        git \
        zlib1g-dev \
        curl

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -

RUN apt-get install -y nodejs

RUN pecl install apcu
RUN docker-php-ext-enable apcu

# For composer and zlib1g-dev also for this module
RUN docker-php-ext-install zip && \
    docker-php-ext-install mysqli && \
    docker-php-ext-install pdo pdo_mysql && \
    docker-php-ext-install gd
# Install composer and Asset plugin for Bower dependencies management
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
#    composer global require "fxp/composer-asset-plugin:~1.2"

WORKDIR /var/www/

COPY ./start.sh /var/www/start.sh

RUN chmod +x /var/www/start.sh

ENTRYPOINT ["sh", "/var/www/start.sh"]
