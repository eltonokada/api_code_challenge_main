class HostnameQuery
  def self.call(filters)
    dns_records = filters[:dns_records]
    hostname_counts = Hostname.joins(:dns_records)
                              .select(:hostname)
                              .where(dns_records: { id: dns_records.ids })
                              .where.not(hostname: (filters[:included] + filters[:excluded]).uniq)
                              .order(:id)
    hostnames = hostname_counts.map{ |item| item.hostname }
    hostnames.tally.map{ |item| {hostname: item[0], count: item[1]} }
  end
end
