class DnsRecord < ApplicationRecord
  has_and_belongs_to_many :hostnames
  validates_presence_of :ip
  validates_uniqueness_of :ip
  accepts_nested_attributes_for :hostnames
end
