# spec/models/dns_record_spec.rb
require 'rails_helper'

RSpec.describe DnsRecord, type: :model do
  # Validation tests
  context 'validations' do
    it 'is valid with valid attributes' do
      dns_record = DnsRecord.new(ip: '192.168.1.1')
      expect(dns_record).to be_valid
    end

    it 'is not valid without an IP' do
      dns_record = DnsRecord.new(ip: nil)
      expect(dns_record).not_to be_valid
    end

    it 'is not valid with a duplicate IP' do
      DnsRecord.create(ip: '192.168.1.1')
      duplicate_dns_record = DnsRecord.new(ip: '192.168.1.1')
      expect(duplicate_dns_record).not_to be_valid
    end
  end

  # Association tests
  context 'associations' do
    it 'can have many hostnames' do
      dns_record = DnsRecord.create(ip: '192.168.1.2')
      hostname1 = Hostname.create(hostname: 'example.com')
      hostname2 = Hostname.create(hostname: 'example.net')

      dns_record.hostnames << hostname1
      dns_record.hostnames << hostname2

      expect(dns_record.hostnames.size).to eq(2)
    end
  end
end
