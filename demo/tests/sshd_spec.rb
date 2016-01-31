# encoding: utf-8

# Skip all controls, if SSH doesn't exist on the system
only_if do
  command('sshd').exist?
end

control "sshd-11" do
  impact 1.0
  title "Server: Set protocol version to SSHv2"
  desc "
    Set the SSH protocol version to 2. Don't use legacy
    insecure SSHv1 connections anymore.
  "
  describe sshd_config do
    its('Protocol') { should eq('2') }
  end
end

control "sshd-7" do
  impact 1.0
  title "Server: Do not permit root-based login with password."
  desc "
    To reduce the potential to gain full privileges
    of a system in the course of an attack (by either misconfiguration
    or vulnerabilities), do not allow login as root with password
  "
  describe sshd_config do
    its('PermitRootLogin') { should match(/no|without-password/) }
  end
end
