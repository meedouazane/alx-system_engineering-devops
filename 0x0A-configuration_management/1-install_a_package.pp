# install flask from pip and ensure that depancances are installed

package { 'python3.8':
  ensure   => '3.8.10',
}

package { 'python3-pip':
  ensure   => present,
}

package { 'werkzeug 2.1.0':
  ensure   => '2.1.0',
  provider => 'pip',
  require  => Package['python3-pip'],
}

package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip',
  require  => Package['python3-pip'],
}
