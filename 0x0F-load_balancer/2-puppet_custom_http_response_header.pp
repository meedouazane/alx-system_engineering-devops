#!/usr/bin/env bash
#Install Nginx web server

exec { 'update server':
  command  => 'apt-get update',
  user     => 'root',
  provider => 'shell',
}

#install nginx
package {'nginx':
  ensure   => 'installed',
  provider => apt,
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
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}

