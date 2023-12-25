# Client configuration file (w/ Puppet)

file { '/root/.ssh/ssh_config':
  ensure => present,
}

file_line { 'Client configuration file':
  path  => '/root/.ssh/ssh_config',
  line  => 'Host *',
  match => '^#?Host \*$',
}

file_line { 'Client configuration file 2':
  path  => '/root/.ssh/ssh_config',
  line  => 'IdentityFile ~/.ssh/school',
  match => '^#?IdentityFile ~/.ssh/school$',
}

file_line { 'Client configuration file 3':
  path  => '/root/.ssh/ssh_config',
  line  => 'PasswordAuthentication no',
  match => '^#?PasswordAuthentication no$',
}
