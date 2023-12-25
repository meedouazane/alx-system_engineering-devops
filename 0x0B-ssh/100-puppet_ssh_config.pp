# Ensure the existence of the SSH config file

file { '/home/m311/.ssh/ssh_config':
  ensure  => file,
  mode    => '744',
  content => "Host * \n\tIdentityFile ~/.ssh/school \n\tPasswordAuthentication no\n",
}
