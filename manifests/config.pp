# @api private
#
# Ensure that the minimal config files are present.
#
# This class is called from ssh for service config.
#
class ssh::config {
  file { 'ssh_config' :
    ensure => file,
    path   => $ssh::ssh_config_path,
    owner  => $ssh::ssh_config_owner,
    group  => $ssh::ssh_config_group,
    mode   => $ssh::ssh_config_mode,
  }

  file { 'sshd_config' :
    ensure => file,
    path   => $ssh::sshd_config_path,
    mode   => $ssh::sshd_config_mode,
    owner  => $ssh::sshd_config_owner,
    group  => $ssh::sshd_config_group,
  }
}
