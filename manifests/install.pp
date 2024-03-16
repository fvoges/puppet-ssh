# @api private
#
# Ensure that the necessary packages are installed
#
class ssh::install {
  package { $ssh::package_name:
    ensure    => present,
    source    => $ssh::package_source,
    adminfile => $ssh::package_adminfile,
  }
}
