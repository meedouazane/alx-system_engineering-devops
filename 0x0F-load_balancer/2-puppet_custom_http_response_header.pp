#!/usr/bin/env bash
#Install Nginx web server

#install nginx
package {'nginx':
  ensure   => 'installed',
  provider => apt,
}

service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}

file {'/etc/nginx/sites-available/default':
  ensure  => file,
  content => '
server {
        listen 80 ;
        listen [::]:80;
        root /var/www/html;
        index index.html;
        server_name _;
        location / {
                try_files $uri $uri/ =404;
                add_header X-Served-By \$hostname always;
        }
}',
  notify  => Service['nginx'],
}
