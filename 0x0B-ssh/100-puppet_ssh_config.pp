# Ensure the existence of the SSH config file

file { '/root/.ssh/ssh_config':
  ensure  => present,
  content => "Host * \n\tIdentityFile ~/.ssh/school \n\tPasswordAuthentication no\n",
}
