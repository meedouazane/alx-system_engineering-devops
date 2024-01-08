#!/usr/bin/env bash
#Install Nginx web server

#install nginx
package {'nginx':
  ensure   => 'installed',
  provider => apt,
}
file_line { 'Add a custom HTTP header':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 default_server;',
  line   => 'add_header X-Served-By $hostname;'
}
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}
