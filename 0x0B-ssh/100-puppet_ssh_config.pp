# Client configuration file (w/ Puppet)

file { '/root/.ssh/ssh_config':
  ensure  => '/root/.ssh/ssh_config',
  content => "Host * \nIdentityFile ~/.ssh/school \nPasswordAuthentication no",
}
