class troubleshooting {
  include troubleshooting::validation

  unless $::provisioned {
    include troubleshooting::provisioning
  }
}
