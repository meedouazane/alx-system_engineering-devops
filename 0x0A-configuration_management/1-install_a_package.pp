# install flask from pip and ensure that depancances are installed

package { 'python3.8':
  ensure   => present,
}

package { 'python3-pip':
  ensure   => present,
}

package { 'werkzeug':
  ensure   => installed,
  provider => 'pip'
  require  => Package['python3-pip']
}

package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip',
  require  => Package['python3-pip']
}
