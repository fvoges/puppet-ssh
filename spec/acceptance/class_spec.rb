require 'spec_helper_acceptance'

describe 'ssh class' do
  context 'default parameters' do
    # Using puppet_apply as a helper
    it 'works idempotently with no errors' do
      pp = <<-MANIFEST
      class { 'ssh': }
      MANIFEST

      # Run it twice and test for idempotency
      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end

    describe package('ssh') do
      it { is_expected.to be_installed }
    end

    describe service('ssh') do
      it { is_expected.to be_enabled }
      it { is_expected.to be_running }
    end
  end
end
