# install flask from pip and ensure that depancances are installed

package { 'python3':
  ensure   => present,
}

package { 'python3-pip':
  ensure   => present,
}

package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip',
  require  => Package['python3-pip'],
}

package { 'werkzeug':
  ensure   => '2.1.0',
  provider => 'pip',
  require  => Package['python3-pip'],
}
