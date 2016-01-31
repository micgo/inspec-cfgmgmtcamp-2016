# encoding: utf-8

control "cis-fs-2.1" do                     # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title "Create separate /tmp partition"    # A human-readable title
  desc "An optional description..."
  describe file('/tmp') do                  # The actual test
    it { should be_mounted }
  end
end
