require 'spec_helper'

describe 'ssh' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context 'ssh class without any parameters' do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('ssh::install').that_comes_before('Class[ssh::config]') }
          it { is_expected.to contain_class('ssh::config') }
          it { is_expected.to contain_class('ssh::service').that_subscribes_to('Class[ssh::config]') }

          case facts[:osfamily]
          when 'RedHat'
            pkg_names = ['openssh-server', 'openssh-clients']
            svc_name = 'sshd'
          when 'Debian'
            pkg_names = ['openssh-server', 'openssh-client']
            svc_name = 'ssh'
          when 'Suse'
            pkg_names = ['openssh']
            svc_name = 'sshd'
          when 'Gentoo'
            pkg_names = ['openssh']
            svc_name = 'sshd'
          when 'Solaris'
            case facts[:kernelrelease]
            when '5.11'
              pkg_names = ['network/ssh', 'network/ssh/ssh-key', 'service/network/ssh']
              svc_name = 'ssh'
            when '5.10'
              pkg_names = ['SUNWsshcu', 'SUNWsshdr', 'SUNWsshdu', 'SUNWsshr', 'SUNWsshu']
              svc_name = 'ssh'
            when '5.9'
              pkg_names = ['SUNWsshcu', 'SUNWsshdr', 'SUNWsshdu', 'SUNWsshr', 'SUNWsshu']
              svc_name = 'sshd'
            end
          else
            pkg_names = ['fail']
            svc_name = 'fail'
          end

          it { is_expected.to contain_service(svc_name) }
          pkg_names.each do |n|
            it { is_expected.to contain_package(n).with_ensure('present') }
          end
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'ssh class without any parameters on Windows' do
      let(:facts) do
        {
          os: {
            family: 'windows',
          },
        }
      end

      it { expect { is_expected.to contain_package('ssh') }.to raise_error(Puppet::Error, %r{Detected osfamily is <windows}) }
    end
  end
end
