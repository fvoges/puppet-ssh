# == Class ssh::params
#
# This class is meant to be called from ssh.
# It sets variables according to platform.
#
class ssh::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'ssh'
      $service_name = 'ssh'
    }
    'RedHat', 'Amazon': {
      $package_name = 'ssh'
      $service_name = 'ssh'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
