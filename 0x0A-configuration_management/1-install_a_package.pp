# install flask from pip3

# ensure that python present
package { 'python3.8':
  ensure => present,
}

# ensure that pip present
package { 'python3-pip':
  ensure => present,
}

# install flask 
package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip',
  require  => Package['python3-pip'],
}

# install werkzeug
package { 'werkzeug':
  ensure   => '2.1.0',
  provider => 'pip',
  require  => Package['python3-pip'],
}
