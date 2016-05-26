class dsciis {

  # TODO: add the correct name to this resource so DSC can trigger reboots
  reboot { ???:
    when    => pending,
    timeout => 15,
  }

  package { 'dotnet4.5.2':
    ensure   => latest,
    provider => 'chocolatey',
    notify   => Reboot['dsc_reboot'],
  }

  vcsrepo { 'C:/inetpub/puppetize':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/puppetlabs-education/asp-starter-site.git',
  }

  # Translate the provided DSC Powershell script into Puppet code below

  # don't forget to add the appropriate relationships
}
