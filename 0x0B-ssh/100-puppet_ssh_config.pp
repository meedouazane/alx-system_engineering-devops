# Ensure the existence of the SSH config file

file { '/root/.ssh/ssh_config':
  ensure  => present,
}
file_line { 'Declare identity file':
  path  => '/root/.ssh/ssh_config',
  line  => 'IdentityFile ~/.ssh/school',
}

file_line { 'Turn off passwd auth':
  path  => '/root/.ssh/ssh_config',
  line  => 'PasswordAuthentication no',
}
