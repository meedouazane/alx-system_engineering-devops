#!/usr/bin/env bash
#Install Nginx web server

#install haproxy
package {'haproxy':
  ensure   => 'installed',
  provider => apt,
}
file {'/etc/haproxy/haproxy.cfg':
  ensure  => file,
  content => 'frontend http-in
    bind *:80
    default_backend servers',
}
file {'/etc/haproxy/haproxy.cfg':
  ensure  => file,
  content => 'backend servers
    balance roundrobin
    server 429410-web-01 54.167.181.186:80 check
    server 429410-web-02 35.153.194.155:80 check',
}
