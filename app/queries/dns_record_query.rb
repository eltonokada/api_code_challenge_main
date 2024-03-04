class DnsRecordQuery

  def self.call(filters)
    DnsRecord.extending(Scopes)
      .joins(:hostnames)
      .included(filters[:included])
      .excluded(filters[:excluded])
      .group('dns_records.id')
      .having('COUNT(dns_records.id) >= ?', filters[:included]&.size||0)
      .order('dns_records.id ASC')
  end

  module Scopes
    def included(included)
      return self if included.blank?
      where(hostnames: { hostname: included })
    end

    def excluded(excluded)
      return self if excluded.blank?
      excluded_record_ids = DnsRecord.joins(:hostnames)
                                     .where(hostnames: { hostname: excluded })
                                     .pluck(:id).uniq
      where.not(id: excluded_record_ids)
    end
  end

end
