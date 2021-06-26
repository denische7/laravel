#!/bin/bash

composer install

chown -R www-data:www-data /var/www/var

chown -R www-data:www-data /var/www/public/uploads

apache2-foreground
