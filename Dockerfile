FROM php:7.1

MAINTAINER Niels Maseberg <admin@nilson-coding.com>

# Install libs
RUN apt-get update \
    && apt-get install -y \
    git \
    zlib1g-dev

RUN docker-php-ext-install \
    zip

# Copy composer.json to image
COPY ./composer.json /composer.json

# Download composer and install dependencies
RUN curl -s http://getcomposer.org/installer | php \
    && php composer.phar install
