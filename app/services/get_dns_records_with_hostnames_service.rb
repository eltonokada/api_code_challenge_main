class GetDnsRecordsWithHostnamesService
  def initialize(page:, included:, excluded:)
    @page = page
    @included = included
    @excluded = excluded
  end

  def call
    dns_records = ::DnsRecordQuery.call(included: @included, excluded: @excluded)
    related_hostnames = ::HostnameQuery.call(dns_records: dns_records, included: @included, excluded: @excluded)

    build_response(dns_records, related_hostnames)
  end

  private

  def build_response(dns_records, related_hostnames)
    {
      records: dns_records.map { |record| { id: record.id, ip_address: record.ip } },
      total_records: dns_records.size,
      related_hostnames: related_hostnames
    }
  end

end
