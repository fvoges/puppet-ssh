# @api private
#
# Ensure that the necessary services are running.
#
class ssh::service {
  service { $ssh::service_name:
    ensure     => $ssh::service_ensure,
    enable     => $ssh::service_enable,
    hasstatus  => $ssh::service_hasstatus,
    hasrestart => $ssh::service_hasrestart,
  }
}
