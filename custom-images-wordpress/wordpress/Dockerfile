FROM php:7.4-fpm-alpine

# Install necessary PHP extensions for WordPress
RUN apk update && apk add --no-cache \
        freetype-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        libzip-dev \
    && docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
    && NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
    && docker-php-ext-install -j${NPROC} gd mysqli pdo pdo_mysql zip

# Download and unpack WordPress into the web root
ENV WORDPRESS_VERSION 6.4.3
RUN curl -o wordpress.tar.gz -fSL "https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz" \
    && tar -xzf wordpress.tar.gz -C /var/www/html/ \
    && rm wordpress.tar.gz \
    && chown -R www-data:www-data /var/www/html/wordpress

# Use the default production configuration
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# Copy a custom WordPress config file into the image
COPY wp-config.php /var/www/html/wordpress

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
