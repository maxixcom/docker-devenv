FROM php:7.2-fpm


RUN apt-get update && apt-get install -y \
# git for composer
	git \
# gd
        libfreetype6-dev \
        libjpeg62-turbo-dev \
#        libmcrypt-dev \
        libpng-dev \
# intl
        libicu-dev \
# mongo
        libssl-dev \
# zookeeper
#	libzookeeper-mt-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
#    && docker-php-ext-install -j$(nproc) mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) intl \
    && docker-php-ext-install -j$(nproc) gettext \
    && docker-php-ext-install -j$(nproc) pdo_mysql mysqli \
    && docker-php-ext-install -j$(nproc) zip \
#    && pecl install redis \
    && pecl install mongodb \
#    && pecl install zookeeper-0.3.2 \
    && docker-php-ext-enable \
#    redis \
#    zookeeper \
    mongodb


RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony && chmod +x /usr/local/bin/symfony

RUN touch /var/log/fpm-php.www.log && chown www-data:www-data /var/log/fpm-php.www.log && chmod 777 /var/log/fpm-php.www.log
