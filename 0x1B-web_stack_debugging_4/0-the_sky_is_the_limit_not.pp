#unset the ulimit variable
exec { 'fix--for-nginx':
  command => "sed -i 's/ULIMIT/# &/' /etc/default/nginx",
  path    => '/usr/local/bin:/bin',
  notify  => Service['nginx'],
}
service { 'nginx':
  ensure => running,
  enable => true,
}
