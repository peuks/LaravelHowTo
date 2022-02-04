FROM php:8.1.1-fpm-alpine

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN docker-php-ext-install pdo pdo_mysql

ARG USER_ID
ARG GROUP_ID
ARG USER

RUN apk add --no-cache $PHPIZE_DEPS \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug



# Create a group and user
RUN addgroup -g ${GROUP_ID} -S ${USER} && adduser -u ${USER_ID}  -S ${USER} -G ${USER} 

# Tell docker that all future commands should run as the appuser user
USER ${USER}

WORKDIR "/app"