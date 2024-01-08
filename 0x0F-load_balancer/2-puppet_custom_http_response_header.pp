#!/usr/bin/env puppet
# Install HAProxy and configure it

# Install haproxy
package { 'haproxy':
  ensure   => 'installed',
  provider => apt,
}

# the HAProxy configuration file
file_line { 'append to /etc/haproxy/haproxy.cfg':
  path   => '/etc/haproxy/haproxy.cfg',
  line   => 'frontend http-in
    bind *:80
    default_backend servers

backend servers
    balance roundrobin
    server 429410-web-01 54.167.181.186:80 check
    server 429410-web-02 35.153.194.155:80 check
',
}
