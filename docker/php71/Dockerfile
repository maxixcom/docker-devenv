FROM php:7.1-fpm

RUN apt-get update && apt-get install -y \
# git for composer
	git \
# gd
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
# intl
        libicu-dev \
# mongo
        libmagickwand-dev \
# mongo
        libssl-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install -j$(nproc) mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) intl \
    && docker-php-ext-install -j$(nproc) gettext \
    && docker-php-ext-install -j$(nproc) pdo_mysql mysqli \
    && docker-php-ext-install -j$(nproc) zip \
    && docker-php-ext-configure opcache --enable-opcache \
    && docker-php-ext-install opcache \
    && pecl install redis \
    && pecl install mongodb \
    && pecl install imagick \
    && docker-php-ext-enable redis mongodb imagick

COPY opcache.ini $PHP_INI_DIR/conf.d/

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony && chmod +x /usr/local/bin/symfony
RUN install -d -o www-data -g www-data -m 0775 /var/lib/php

RUN touch /var/log/fpm-php.www.log && chown www-data:www-data /var/log/fpm-php.www.log && chmod 777 /var/log/fpm-php.www.log
