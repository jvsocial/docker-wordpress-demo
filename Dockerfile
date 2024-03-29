FROM php:7.2-apache
RUN    apt-get update \
    && apt-get install -y --no-install-recommends \
         libjpeg-dev \
         libpng-dev \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && docker-php-ext-install gd mysqli opcache \
    && a2enmod rewrite expires \
    && curl -# -LO https://wordpress.org/latest.tar.gz \
    && tar xzf latest.tar.gz \
    && mv wordpress/* /var/www/html/ \
    && chown 33:33 /var/www/html -R
