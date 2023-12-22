file { '/tmp/school':
  ensure => 'present',
  group  => 'www-data',
  owner  => 'www-data',
  mode   => '0744'
}
