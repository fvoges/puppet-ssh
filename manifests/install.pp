# == Class ssh::install
#
# This class is called from ssh for install.
#
class ssh::install {

  package { $::ssh::package_name:
    ensure    => present,
    source    => $::ssh::package_source,
    adminfile => $::ssh::package_adminfile,
  }
}
