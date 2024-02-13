# Use the official PHP image with FPM
FROM php:7.4-fpm

# Install necessary PHP extensions for WordPress
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libzip-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo pdo_mysql zip

# Download and unpack WordPress into the web root
ENV WORDPRESS_VERSION 5.7.2

RUN curl -o wordpress.tar.gz -fSL "https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz" \
    && tar -xzf wordpress.tar.gz -C /var/www/html/ \
    && rm wordpress.tar.gz \
    && chown -R www-data:www-data /var/www/html/wordpress

# Use the default production configuration
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# Copy a custom WordPress config file into the image
# Note: You need to create wp-config.php that includes your database settings
COPY wp-config.php /var/www/html/wordpress

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
