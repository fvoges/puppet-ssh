# Manage OpenSSH
#
# @author Federico Voges
#
# @summary
#   This module manages the OpenSSH service, but doesn't provide a way to manage the configuration.
#   Use [puppet/augeasproviders_ssh](https://forge.puppet.com/modules/puppet/augeasproviders_ssh) to manage the configuration
#
# @param [Optional[String]                                  ] package_adminfile
#    `adminfile` parameter for the package resource
# @param [Variant[String,Array[String]]                     ] package_name
#    package names to manage
# @param [String                                            ] package_ensure
#    `ensure` parameter for the package resource
# @param [Optional[String]                                  ] package_source
# @param [Boolean                                           ] service_enable
# @param [Enum['running','stopped']                         ] service_ensure
# @param [Boolean                                           ] service_hasrestart
# @param [Boolean                                           ] service_hasstatus
# @param [String                                            ] service_name
# @param [String                                            ] ssh_config_group
# @param [Ssh::File_mode                                    ] ssh_config_mode
# @param [String                                            ] ssh_config_owner
# @param [Variant[Stdlib::Unixpath,Array[Stdlib::Unixpath]] ] ssh_config_path
# @param [String                                            ] sshd_config_group
# @param [Ssh::File_mode                                    ] sshd_config_mode
# @param [String                                            ] sshd_config_owner
# @param [Variant[Stdlib::Unixpath,Array[Stdlib::Unixpath]] ] sshd_config_path
# @param [Variant[Stdlib::Unixpath,Array[Stdlib::Unixpath]] ] sshd_hostkey
#
class ssh (
  Optional[String]                                  $package_adminfile,
  Variant[String,Array[String]]                     $package_name,
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
  Ssh::File_mode                                    $sshd_config_mode,
  String                                            $sshd_config_owner,
  Variant[Stdlib::Unixpath,Array[Stdlib::Unixpath]] $sshd_config_path,
  Variant[Stdlib::Unixpath,Array[Stdlib::Unixpath]] $sshd_hostkey,
) {
  contain ssh::install
  contain ssh::config
  contain ssh::service

  Class['ssh::install']
  -> Class['ssh::config']
  ~> Class['ssh::service']
}
