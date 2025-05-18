# @api private
function ssh::params (
  Hash                  $options, # We ignore both of these arguments, but
  Puppet::LookupContext $context, # the function still needs to accept them.
) {
  $common = {
    'ssh::package_ensure'     => 'present',
    'ssh::service_enable'     => true,
    'ssh::service_ensure'     => 'running',
    'ssh::service_hasrestart' => true,
    'ssh::ssh_config_group'   => 'root',
    'ssh::ssh_config_mode'    => '0644',
    'ssh::ssh_config_owner'   => 'root',
    'ssh::ssh_config_path'    => '/etc/ssh/ssh_config',
    'ssh::sshd_config_group'  => 'root',
    'ssh::sshd_config_mode'   => '0644',
    'ssh::sshd_config_owner'  => 'root',
    'ssh::sshd_config_path'   => '/etc/ssh/sshd_config',
  }

  case $facts['os']['family'] {
    'RedHat': {
      $os = {
        'ssh::package_name'      => [
          'openssh-server',
          'openssh-clients',
        ],
        'ssh::service_name'      => 'sshd',
        'ssh::package_source'    => undef,
        'ssh::package_adminfile' => undef,
        'ssh::sshd_config_mode'  => '0600',
        'ssh::service_hasstatus' => true,
        'ssh::sshd_hostkey'      => ['/etc/ssh/ssh_host_rsa_key',],
      }
    }

    'Suse': {
      $os = {
        'ssh::package_name'      => 'openssh',
        'ssh::service_name'      => 'sshd',
        'ssh::package_source'    => undef,
        'ssh::package_adminfile' => undef,
        'ssh::sshd_config_mode'  => '0600',
        'ssh::service_hasstatus' => true,
        'ssh::sshd_hostkey'      => ['/etc/ssh/ssh_host_rsa_key',],
      }
    }

    'Gentoo': {
      $os = {
        'ssh::package_name'      => 'openssh',
        'ssh::service_name'      => 'sshd',
        'ssh::package_source'    => undef,
        'ssh::package_adminfile' => undef,
        'ssh::sshd_config_mode'  => '0600',
        'ssh::service_hasstatus' => true,
        'ssh::sshd_hostkey'      => ['/etc/ssh/ssh_host_rsa_key',],
      }
    }

    'Debian': {
      # Ubuntu 16.04
      if $facts['os']['release']['full'] == '16.04' {
        $release = {
          'ssh::sshd_hostkey'         => [
            '/etc/ssh/ssh_host_rsa_key',
            '/etc/ssh/ssh_host_dsa_key',
            '/etc/ssh/ssh_host_ecdsa_key',
            '/etc/ssh/ssh_host_ed25519_key',
          ],
        }
      } else {
        $release = {
          'ssh::sshd_hostkey'                => ['/etc/ssh/ssh_host_rsa_key',],
        }
      }

      $family = {
        'ssh::package_name'                  => [
          'openssh-server',
          'openssh-client',
        ],
        'ssh::service_name'                  => 'ssh',
        'ssh::package_source'                => undef,
        'ssh::package_adminfile'             => undef,
        'ssh::sshd_config_mode'              => '0600',
        'ssh::service_hasstatus'             => true,
      }
      $os = $family + $release
    }

    'Solaris': {
      $family = {
        'ssh::sshd_config_mode'        => '0644',
        'ssh::package_adminfile'       => undef,
        'ssh::sshd_hostkey'            => ['/etc/ssh/ssh_host_rsa_key',],
      }
      case $facts['kernelrelease'] {
        '5.11': {
          $release = {
            'ssh::package_name'        => [
              'network/ssh',
              'network/ssh/ssh-key',
              'service/network/ssh',
            ],
            'ssh::service_name'        => 'ssh',
            'ssh::service_hasstatus'   => true,
            'ssh::package_source'      => undef,
          }
        }
        '5.10': {
          $release = {
            'ssh::package_name'        => [
              'SUNWsshcu',
              'SUNWsshdr',
              'SUNWsshdu',
              'SUNWsshr',
              'SUNWsshu',
            ],
            'ssh::service_name'        => 'ssh',
            'ssh::service_hasstatus'   => true,
            'ssh::package_source'      => '/var/spool/pkg',
          }
        }
        '5.9' : {
          $release = {
            'ssh::package_name'        => [
              'SUNWsshcu',
              'SUNWsshdr',
              'SUNWsshdu',
              'SUNWsshr',
              'SUNWsshu',
            ],
            'ssh::service_name'        => 'sshd',
            'ssh::service_hasstatus'   => false,
            'ssh::package_source'      => '/var/spool/pkg',
          }
        }
        default: {
          fail('SSH module supports Solaris kernel release 5.9, 5.10 and 5.11.')
        }
      }
      $os = $family + $release
    }
    default: {
      fail("SSH supports osfamilies RedHat, SuSE, Debian and Solaris. Detected osfamily is <${::facts['os']['family']}>.")
    }
  }
  $common + $os
}
