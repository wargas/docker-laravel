FROM composer:2 AS composer

FROM dunglas/frankenphp:latest AS fraken

HEALTHCHECK NONE

COPY --from=composer /usr/bin/composer /usr/bin/composer

WORKDIR /app

# Instalar extensões necessárias para Laravel
RUN install-php-extensions \
    pdo_mysql \
    mbstring \
    bcmath \
    intl \
    zip \
    opcache \
    gd \
    sockets \
    intl


RUN apt update -y

RUN apt install iputils-ping -y
