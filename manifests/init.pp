# Class: ssh
# ===========================
#
# Full description of class ssh here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class ssh (
  Optional[String]                                  $package_adminfile,
  Variant[Stdlib::Unixpath,Array[Stdlib::Unixpath]] $package_name,
  String                                            $package_ensure,
  Optional[String]                                  $package_source,
  Boolean                                           $service_enable,
  Enum['running','stopped']                         $service_ensure,
  Boolean                                           $service_hasrestart,
  Boolean                                           $service_hasstatus,
  String                                            $service_name,
  String                                            $ssh_config_group,
  Ssh::File_mode                                    $ssh_config_mode,
  String                                            $ssh_config_owner,
  Variant[Stdlib::Unixpath,Array[Stdlib::Unixpath]] $ssh_config_path,
  String                                            $sshd_config_group,
  Variant[Stdlib::Unixpath,Array[Stdlib::Unixpath]] $sshd_config_hostkey,
  Ssh::File_mode                                    $sshd_config_mode,
  String                                            $sshd_config_owner,
  Variant[Stdlib::Unixpath,Array[Stdlib::Unixpath]] $sshd_config_path,
) {

  contain ::ssh::install
  contain ::ssh::config
  contain ::ssh::service

  Class['::ssh::install']
  -> Class['::ssh::config']
  ~> Class['::ssh::service']
}
