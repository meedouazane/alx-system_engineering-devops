# Client configuration file (w/ Puppet)

file { '/root/.ssh/ssh_config':
  ensure  => file,
  content => "Host *\nIdentityFile ~/.ssh/school\nPasswordAuthentication no\n",
}

augeas {'Client configuration':
  context => '/files/root/.ssh/ssh_config',
  changes => [
    'set Host[1] *',
    'set IdentityFile[1] ~/.ssh/school',
    'set PasswordAuthentication[1] no',
  ],
}
