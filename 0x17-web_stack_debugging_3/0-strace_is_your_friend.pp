# fixing error and automate it using Puppet
file { '/etc/apache2/sites-available/000-default.conf':
  ensure  => file,
  content => "
<VirtualHost *:80>
        ServerName localhost
        ServerAdmin webmaster@localhost
        DocumentRoot  /var/www/html/wp-content/
        ErrorLog \${APACHE_LOG_DIR}/error.log
        CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>",
  notify  => Exec['restart_apache'],
}

exec { 'restart_apache':
  command     => '/etc/init.d/apache2 restart',
  refreshonly => true,
}
