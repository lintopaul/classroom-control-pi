class profile::admins {
  # Windows requires a plain text password, but Linux requires a hash.
  # Both password values are the same.
  $password = $osfamily ? {
    'RedHat'  => '$1$HdDw//gC$2VBiQ1x5blLPwNS.G.Iw21',
    'windows' => 'Puppet8Labs!',
  }

# What does this resource need to complete it? How would you declare another?
#  skeleton::managed_user { ???:
#    password => $password,
#  }
}
