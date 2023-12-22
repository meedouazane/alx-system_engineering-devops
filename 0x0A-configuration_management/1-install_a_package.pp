# install flask from pip and ensure that depancances are installed

package { 'python3-pip':
  ensure   => 'installed',
}

package { 'werkzeug':
  ensure   => 'installed',
  provider => 'pip3'
}

package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
  require  => Package['python3-pip']
}
