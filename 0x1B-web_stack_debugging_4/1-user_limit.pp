# remove user limitation
exec { 'change-os-configuration-for-holberton-user':
  command => "sed -i 's/holberton/# &/' /etc/security/limits.conf",
  path    => '/usr/local/bin:/bin',
}
