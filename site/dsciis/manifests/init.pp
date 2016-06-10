class dsciis {

  # TODO: add the correct name to this resource so DSC can trigger reboots
  reboot { '???':
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

  # Translate the commented DSC Powershell resources into Puppet code below
  # Add relationship chaining arrows between each resource
#  WindowsFeature iis {
#    Ensure    = 'Present'
#    Name      = 'Web-Server'
#  }
#  WindowsFeature iisscriptingtools {
#    Ensure    = 'Present',
#    Name      = 'Web-Scripting-Tools',
#  }
#  WindowsFeature aspnet45 {
#    Ensure    = 'Present'
#    Name      = 'Web-Asp-Net45'
#    DependsOn = @("[WindowsFeature]iis")
#  }
  -> dsc_xwebsite{'defaultsite':
    dsc_ensure       => 'Present',
    dsc_name         => 'Default Web Site',
    dsc_state        => 'Stopped',
    dsc_physicalpath => 'C:\inetpub\wwwroot',
  }
  -> dsc_xwebapppooldefaults{'newwebapppool':
    dsc_managedruntimeversion     => 'v4.0',
    dsc_identitytype              => 'ApplicationPoolIdentity',
    dsc_applyto                   => 'Machine',
  }
  -> dsc_xwebapppool{'newwebapppool':
    dsc_name                      => 'PuppetCodezAppPool',
    dsc_ensure                    => 'Present',
    dsc_state                     => 'Started',
  }
  -> dsc_xwebsite{'newwebsite':
    dsc_ensure          => 'Present',
    dsc_name            => 'PuppetCodez',
    dsc_state           => 'Started',
    dsc_physicalpath    => 'C:\inetpub\puppetize',
    dsc_applicationpool => 'PuppetCodezAppPool',
    dsc_bindinginfo     => [{
      protocol => 'HTTP',
      port     => 80,
    }],
    require             => [
#      Vcsrepo[???],                     # add the relationship reference titles
#      Package[???],
    ],
  }

}
