class examples::puppetize {
  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }
  
  $path = $osfamily ? {
    'centos'  => '/root/example.pp',
    'windows' => 'C:/Users/Administrators/example.pp',
  }

  file { $path:
    ensure  => file,
    content => epp('/examples/example.epp'),
  }
}
