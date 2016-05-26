class motd {
  exec { "figlet 'Welcome to ${::fqdn}!' > /etc/motd":
    path    => '/bin:/usr/bin:/usr/local/bin',
    creates => '/etc/motd',
  }

  package { 'figlet':
    ensure => present,
  }
}