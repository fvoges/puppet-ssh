require 'spec_helper'

describe 'ssh' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "ssh class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('ssh::install').that_comes_before('Class[ssh::config]') }
          it { is_expected.to contain_class('ssh::config') }
          it { is_expected.to contain_class('ssh::service').that_subscribes_to('Class[ssh::config]') }

          case facts['osfamily']
          when 'RedHat'
            it { is_expected.to contain_service('sshd') }
            it { is_expected.to contain_package('openssh-server').with_ensure('present') }
            it { is_expected.to contain_package('openssh-clients').with_ensure('present') }
          when 'Suse'
            it { is_expected.to contain_service('sshd') }
            it { is_expected.to contain_package('openssh').with_ensure('present') }
          when 'Debian'
            it { is_expected.to contain_service('ssh') }
            it { is_expected.to contain_package('openssh-server').with_ensure('present') }
            it { is_expected.to contain_package('openssh-client').with_ensure('present') }
          when 'Solaris'
            case facts['kernelrelease']
            when '5.11'
              it { is_expected.to contain_service('ssh') }
              it { is_expected.to contain_package('network/ssh').with_ensure('present') }
              it { is_expected.to contain_package('network/ssh-key').with_ensure('present') }
              it { is_expected.to contain_package('service/network/ssh').with_ensure('present') }
            when '5.10'
              it { is_expected.to contain_service('ssh') }
              it { is_expected.to contain_package('SUNWsshcu').with_ensure('present') }
              it { is_expected.to contain_package('SUNWsshdr').with_ensure('present') }
              it { is_expected.to contain_package('SUNWsshdu').with_ensure('present') }
              it { is_expected.to contain_package('SUNWsshr').with_ensure('present') }
              it { is_expected.to contain_package('SUNWsshu').with_ensure('present') }
            when '5.9'
              it { is_expected.to contain_service('sshd') }
              it { is_expected.to contain_package('SUNWsshcu').with_ensure('present') }
              it { is_expected.to contain_package('SUNWsshdr').with_ensure('present') }
              it { is_expected.to contain_package('SUNWsshdu').with_ensure('present') }
              it { is_expected.to contain_package('SUNWsshr').with_ensure('present') }
              it { is_expected.to contain_package('SUNWsshu').with_ensure('present') }
            end
          end
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'ssh class without any parameters on Windows' do
      let(:facts) do
        {
          :os => {
            :family => 'windows',
          },
        }
      end

      it { expect { is_expected.to contain_package('ssh') }.to raise_error(Puppet::Error, /Detected osfamily is <windows/) }
    end
  end
end
