# Reference

<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

### Classes

#### Public Classes

* [`ssh`](#ssh): This module manages the OpenSSH service, but doesn't provide a way to manage the configuration.
Use [puppet/augeasproviders_ssh](https://forge.puppet.com/modules/puppet/augeasproviders_ssh) to manage the configuration

#### Private Classes

* `ssh::config`: Ensure that the minimal config files are present.  This class is called from ssh for service config.
* `ssh::install`: Ensure that the necessary packages are installed
* `ssh::service`: Ensure that the necessary services are running.

### Functions

#### Private Functions

* `ssh::params`

### Data types

#### Private Data types

* `Ssh::File_mode`

## Classes

### <a name="ssh"></a>`ssh`

Manage OpenSSH

#### Parameters

The following parameters are available in the `ssh` class:

* [`package_adminfile`](#-ssh--package_adminfile)
* [`package_name`](#-ssh--package_name)
* [`package_ensure`](#-ssh--package_ensure)
* [`package_source`](#-ssh--package_source)
* [`service_enable`](#-ssh--service_enable)
* [`service_ensure`](#-ssh--service_ensure)
* [`service_hasrestart`](#-ssh--service_hasrestart)
* [`service_hasstatus`](#-ssh--service_hasstatus)
* [`service_name`](#-ssh--service_name)
* [`ssh_config_group`](#-ssh--ssh_config_group)
* [`ssh_config_mode`](#-ssh--ssh_config_mode)
* [`ssh_config_owner`](#-ssh--ssh_config_owner)
* [`ssh_config_path`](#-ssh--ssh_config_path)
* [`sshd_config_group`](#-ssh--sshd_config_group)
* [`sshd_config_mode`](#-ssh--sshd_config_mode)
* [`sshd_config_owner`](#-ssh--sshd_config_owner)
* [`sshd_config_path`](#-ssh--sshd_config_path)
* [`sshd_hostkey`](#-ssh--sshd_hostkey)

##### <a name="-ssh--package_adminfile"></a>`package_adminfile`

Data type: `Optional[String]`

`adminfile` parameter for the package resource

##### <a name="-ssh--package_name"></a>`package_name`

Data type: `Variant[String,Array[String]]`

package names to manage

##### <a name="-ssh--package_ensure"></a>`package_ensure`

Data type: `String`

`ensure` parameter for the package resource

##### <a name="-ssh--package_source"></a>`package_source`

Data type: `Optional[String]`



##### <a name="-ssh--service_enable"></a>`service_enable`

Data type: `Boolean`



##### <a name="-ssh--service_ensure"></a>`service_ensure`

Data type: `Enum['running','stopped']`



##### <a name="-ssh--service_hasrestart"></a>`service_hasrestart`

Data type: `Boolean`



##### <a name="-ssh--service_hasstatus"></a>`service_hasstatus`

Data type: `Boolean`



##### <a name="-ssh--service_name"></a>`service_name`

Data type: `String`



##### <a name="-ssh--ssh_config_group"></a>`ssh_config_group`

Data type: `String`



##### <a name="-ssh--ssh_config_mode"></a>`ssh_config_mode`

Data type: `Ssh::File_mode`



##### <a name="-ssh--ssh_config_owner"></a>`ssh_config_owner`

Data type: `String`



##### <a name="-ssh--ssh_config_path"></a>`ssh_config_path`

Data type: `Variant[Stdlib::Unixpath,Array[Stdlib::Unixpath]]`



##### <a name="-ssh--sshd_config_group"></a>`sshd_config_group`

Data type: `String`



##### <a name="-ssh--sshd_config_mode"></a>`sshd_config_mode`

Data type: `Ssh::File_mode`



##### <a name="-ssh--sshd_config_owner"></a>`sshd_config_owner`

Data type: `String`



##### <a name="-ssh--sshd_config_path"></a>`sshd_config_path`

Data type: `Variant[Stdlib::Unixpath,Array[Stdlib::Unixpath]]`



##### <a name="-ssh--sshd_hostkey"></a>`sshd_hostkey`

Data type: `Variant[Stdlib::Unixpath,Array[Stdlib::Unixpath]]`



