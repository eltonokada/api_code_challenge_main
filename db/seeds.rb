# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ip1 = '1.1.1.1'
ip2 = '2.2.2.2'
ip3 = '3.3.3.3'
ip4 = '4.4.4.4'
ip5 = '5.5.5.5'

lorem = 'lorem.com'
ipsum = 'ipsum.com'
dolor = 'dolor.com'
amet = 'amet.com'
sit = 'sit.com'

# Define payloads as hashes
payloads = [
  {
    dns_records: {
      ip: ip1,
      hostnames_attributes: [
        { hostname: lorem },
        { hostname: ipsum },
        { hostname: dolor },
        { hostname: amet }
      ]
    }
  },
  {
    dns_records: {
      ip: ip2,
      hostnames_attributes: [
        { hostname: ipsum }
      ]
    }
  },
  {
    dns_records: {
      ip: ip3,
      hostnames_attributes: [
        { hostname: ipsum },
        { hostname: dolor },
        { hostname: amet }
      ]
    }
  },
  {
    dns_records: {
      ip: ip4,
      hostnames_attributes: [
        { hostname: ipsum },
        { hostname: dolor },
        { hostname: sit },
        { hostname: amet }
      ]
    }
  },
  {
    dns_records: {
      ip: ip5,
      hostnames_attributes: [
        { hostname: dolor },
        { hostname: sit }
      ]
    }
  }
]

# Seed the database with the payloads
payloads.each do |payload|
  DnsRecord.create(payload[:dns_records])
end
