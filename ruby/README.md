# DNS Lookup API - Ruby Gem

DNS Lookup retrieves published DNS records for any domain, including IPv4 (A), IPv6 (AAAA), and mail exchange (MX) servers. It provides hostnames, priorities, and dual-stack status flags, while paid plans add TXT, CNAME, and nameserver records.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_dnslookup'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_dnslookup
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_dnslookup'

# Initialize the client
client = APIVerve::Dnslookup::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({ domain: "myspace.com" })

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ domain: "myspace.com" })
  puts response["data"]
rescue APIVerve::Dnslookup::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Dnslookup::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Dnslookup::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "domain": "myspace.com",
    "records": {
      "A": [
        "34.111.176.156"
      ],
      "AAAA": null,
      "CNAME": null,
      "MX": [
        {
          "exchange": "us-smtp-inbound-1.mimecast.com",
          "priority": 10
        },
        {
          "exchange": "us-smtp-inbound-2.mimecast.com",
          "priority": 10
        }
      ],
      "NS": [
        "ns-cloud-a4.googledomains.com",
        "ns-cloud-a1.googledomains.com",
        "ns-cloud-a2.googledomains.com",
        "ns-cloud-a3.googledomains.com"
      ],
      "PTR": null,
      "SRV": null,
      "SOA": {
        "nsname": "ns-cloud-a1.googledomains.com",
        "hostmaster": "cloud-dns-hostmaster.google.com",
        "serial": 2,
        "refresh": 21600,
        "retry": 3600,
        "expire": 259200,
        "minttl": 300
      },
      "TXT": [
        "cr40m536tje9on1slld9bi81bg",
        "qpdYoeakhlmAxsnmxgAVFmJgUSibqb/y+Eu6GGn8pdmLf+mFGIB3jhRAxIC5KObsPMES9MW2c+oOrpOo/lCQVw==",
        "oZ19a+EOIwWVDPJ7POj14UAGBfzk9xcJMmsTUAMUy7H82sDuVCxvw9rZqdg3znFrdTH04+49zd1djhEAt0ooiA==",
        "MS=ms89904786",
        "google-site-verification=eu-3gW1JePvsGRRCaEvH17YUOTFJNofm4lnz2Pk0LTc",
        "google-site-verification=q0iWqpcfOBclAJaCeWh83v62QQ4uCgbWObQ08p37qgU",
        "al4upe6q5cl13sg4srvfivflvg",
        "v=spf1 mx ip4:63.208.226.34 ip4:204.16.32.0/22 ip4:67.134.143.0/24 ip4:216.205.243.0/24 ip4:34.85.156.5/32 ip4:35.245.108.108/32 ip4:34.86.129.193/32 ip4:34.86.134.94/32 ip4:34.85.222.234/32 ip4:34.86.176.234/32 ip4:34.86.125.212/32 ip4:34.85.224.60/32 ip4:34.86.160.49/32 ip4:35.245.64.166/32 ip4:35.188.226.11/32 ip4:34.86.208.228/32 ip4:34.85.216.144/32 ip4:35.221.22.153/32 ip4:34.86.137.108/32 ip4:34.86.51.35/32 ip4:34.150.221.40/32 ip4:34.85.216.70/32 ip4:34.86.37.191/32 ip4:34.85.214.215/32 ip4:35.236.234.82/32 ip4:34.86.161.241/32 ip4:216.32.181.16 ip4:216.178.32.0/20 ip4:168.235.224.0/24 include:_netblocks.mimecast.com -all",
        "cj65vjpq0s1v9u7vfo020c6rel"
      ],
      "CAA": null
    },
    "summary": {
      "hasIPv6": false,
      "hasMailServers": true,
      "hasSPF": true
    }
  }
}
```

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/dnslookup?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/dnslookup?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/dnslookup?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
