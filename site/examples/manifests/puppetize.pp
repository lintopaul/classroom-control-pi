class examples::puppetize {

  if $osfamily == 'RedHat' {
    file { '/root/example.pp':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => epp('examples/example.epp'),
    }
  }
  else {
    file { 'C:/Users/Administrator/example.pp':
      ensure  => file,
      owner   => 'Administrator',
      group   => 'Administrator',
      mode    => '0664',
      content => epp('examples/example.epp'),
    }
  }
  
}
