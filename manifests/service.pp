# == Class ssh::service
#
# This class is meant to be called from ssh.
# It ensure the service is running.
#
class ssh::service {

  service { $::ssh::service_name:
    ensure     => $::ssh::service_ensure,
    enable     => $::ssh::service_enable,
    hasstatus  => $::ssh::service_hasstatus,
    hasrestart => $::ssh::service_hasrestart,
  }
}
