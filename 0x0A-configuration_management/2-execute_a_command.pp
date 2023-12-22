# create a manifest that kills a process named killmenow

exec { 'pkil':
  command  => 'pkill killmenow',
  provider => 'shell',
}
