<%
case $osfamily {
  'RedHat': {
    $path  = '/etc/motd'
    $owner = 'root'
    $group = 'root'
    $mode  = '0644'
  }
  'windows': {
    $path  = 'C:/Users/Administrator/Desktop/README.txt'
    $owner = 'Administrator'
    $group = 'Administrators'
    $mode  = '0664'
  }
}
-%>
file { '<%= $path %>':
  ensure  => file,
  owner   => '<%= $owner %>',
  group   => '<%= $group %>',
  mode    => '<%= $mode %>',
  content => "Hey, Puppet is fun!\n",
}

package { 'cowsay':
  ensure   => present,
  provider => gem,
}
