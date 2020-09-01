FROM php:7.3-apache
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN apt-get update -y && apt-get install -y libwebp-dev libjpeg62-turbo-dev libpng-dev libxpm-dev \
    libfreetype6-dev
RUN apt-get update && \
    apt-get install -y \
    zlib1g-dev 
RUN docker-php-ext-install mbstring
RUN apt-get install -y libzip-dev
RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    libzip-dev
RUN docker-php-ext-install zip
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    --with-png-dir=/usr/include/
RUN docker-php-ext-install gd
RUN apt-get update && apt-get install -y libmagickwand-dev --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN printf "\n" | pecl install imagick
RUN docker-php-ext-enable imagick
RUN a2enmod rewrite
RUN chmod -R 777 /var/www/html