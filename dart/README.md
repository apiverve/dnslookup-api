# DNS Lookup API - Dart/Flutter Client

DNS Lookup retrieves published DNS records for any domain, including IPv4 (A), IPv6 (AAAA), and mail exchange (MX) servers. It provides hostnames, priorities, and dual-stack status flags, while paid plans add TXT, CNAME, and nameserver records.

[![pub package](https://img.shields.io/pub/v/apiverve_dnslookup.svg)](https://pub.dev/packages/apiverve_dnslookup)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [DNS Lookup API](https://apiverve.com/marketplace/dnslookup?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_dnslookup: ^1.2.5
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_dnslookup/apiverve_dnslookup.dart';

void main() async {
  final client = DnslookupClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'domain': 'myspace.com',
      'type': 'A,MX,TXT'
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "domain": "google.com",
    "records": {
      "A": [
        "172.253.156.100",
        "172.253.156.113",
        "172.253.156.101",
        "172.253.156.139",
        "172.253.156.138",
        "172.253.156.102"
      ],
      "AAAA": [
        "2607:f8b0:4023:100d::65",
        "2607:f8b0:4023:100d::8a",
        "2607:f8b0:4023:100d::71",
        "2607:f8b0:4023:100d::64"
      ],
      "CNAME": null,
      "MX": [
        {
          "exchange": "smtp.google.com",
          "priority": 10
        }
      ],
      "NS": [
        "ns4.google.com",
        "ns3.google.com",
        "ns2.google.com",
        "ns1.google.com"
      ],
      "PTR": null,
      "SRV": null,
      "SOA": {
        "nsname": "ns1.google.com",
        "hostmaster": "dns-admin.google.com",
        "serial": 1005474929,
        "refresh": 900,
        "retry": 900,
        "expire": 1800,
        "minttl": 60
      },
      "TXT": [
        [
          "onetrust-domain-verification=0d477fe608074e6f9c12bca7826035cc"
        ],
        [
          "work-accounts-domain-verification=Tcj6JjIMZOw2KsSEw2Nt2rLae89tN6"
        ],
        [
          "google-site-verification=wD8N7i1JTNTkezJ49swvWW48f8_9xveREV4oB-0Hf5o"
        ],
        [
          "Z29vZ2xl"
        ],
        [
          "globalsign-smime-dv=CDYX+XFHUw2wml6/Gb8+59BsH31KzUr6c1l2BPvqKX8="
        ],
        [
          "arcules-domain-verification=2R4t5G7nI6tRCo61lpxxbLksPYstxhGmtV75cpr8x9K"
        ],
        [
          "v=spf1 include:_spf.google.com ~all"
        ],
        [
          "_r4rd1pvwyrpi7sw4a3hzmw8e51yh9td"
        ],
        [
          "apple-domain-verification=30afIBcvSuDV2PLX"
        ],
        [
          "onetrust-domain-verification=6d685f1d41a94696ad7ef771f68993e0"
        ],
        [
          "facebook-domain-verification=22rm551cu4k0ab0bxsw536tlds4h95"
        ],
        [
          "google-site-verification=TV9-DBe4R80X4v0M4U_bd_J9cpOJM0nikft0jAgjmsQ"
        ],
        [
          "MS=E4A68B9AB2BB9670BCE15412F62916164C0B20BB"
        ],
        [
          "docusign=05958488-4752-4ef2-95eb-aa7ba8a3bd0e"
        ],
        [
          "google-site-verification=4ibFUgB-wXLQ_S7vsXVomSTVamuOXBiVAzpR5IZ87D0"
        ],
        [
          "docusign=1b0a6754-49b1-4db5-8540-d2c12664b289"
        ],
        [
          "cisco-ci-domain-verification=47c38bc8c4b74b7233e9053220c1bbe76bcc1cd33c7acf7acd36cd6a5332004b"
        ]
      ],
      "CAA": [
        {
          "critical": 0,
          "issue": "pki.goog"
        }
      ]
    },
    "ttl": {
      "A": 10,
      "AAAA": 2,
      "CNAME": null,
      "MX": 74,
      "NS": 15382,
      "PTR": null,
      "SRV": null,
      "SOA": 25,
      "TXT": 300,
      "CAA": 21600
    },
    "summary": {
      "hasIPv6": true,
      "hasMailServers": true,
      "hasSPF": true
    }
  }
}
```

## API Reference

- **API Home:** [DNS Lookup API](https://apiverve.com/marketplace/dnslookup?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/dnslookup](https://docs.apiverve.com/ref/dnslookup?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
