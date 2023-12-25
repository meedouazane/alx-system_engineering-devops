# Client configuration file (w/ Puppet)

file { '/root/.ssh/ssh_config':
  ensure  => file,
}

file_line {'Client configuration':
  path   => '/root/.ssh/ssh_config',
  line   => ['Host *', 'IdentityFile ~/.ssh/school', 'PasswordAuthentication no'],
  ensure => present,
}
