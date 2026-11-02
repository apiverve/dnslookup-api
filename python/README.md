DNS Lookup API
============

DNS Lookup retrieves published DNS records for any domain, including IPv4 (A), IPv6 (AAAA), and mail exchange (MX) servers. It provides hostnames, priorities, and dual-stack status flags, while paid plans add TXT, CNAME, and nameserver records.


[![PyPI version](https://img.shields.io/pypi/v/apiverve-dnslookup.svg)](https://pypi.org/project/apiverve-dnslookup/)

This is a Python wrapper for the [DNS Lookup API](https://apiverve.com/marketplace/dnslookup?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-dnslookup
```

Using `pip3`:

```bash
pip3 install apiverve-dnslookup
```

---

## Configuration

Before using the DNS Lookup API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_dnslookup.apiClient import DnslookupAPIClient

# Initialize the client with your APIVerve API key
api = DnslookupAPIClient("[YOUR_API_KEY]")

query = {
    "domain": "myspace.com",
    "type": "A,MX,TXT"
}

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The DNS Lookup API documentation is found here: [https://docs.apiverve.com/ref/dnslookup](https://docs.apiverve.com/ref/dnslookup?utm_source=pypi&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_dnslookup.apiClient import DnslookupAPIClient

# Initialize the client with your APIVerve API key
api = DnslookupAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = {
    "domain": "myspace.com",
    "type": "A,MX,TXT"
}
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

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

---

## Error Handling

The API client provides comprehensive error handling through the `DnslookupAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_dnslookup.apiClient import DnslookupAPIClient, DnslookupAPIClientError

api = DnslookupAPIClient("[YOUR_API_KEY]")

query = {
    "domain": "myspace.com",
    "type": "A,MX,TXT"
}

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except DnslookupAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_dnslookup.apiClient import DnslookupAPIClient, DnslookupAPIClientError

api = DnslookupAPIClient("[YOUR_API_KEY]")

query = {
    "domain": "myspace.com",
    "type": "A,MX,TXT"
}

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except DnslookupAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_dnslookup.apiClient import DnslookupAPIClient, DnslookupAPIClientError

query = {
    "domain": "myspace.com",
    "type": "A,MX,TXT"
}

# Using context manager ensures proper cleanup
with DnslookupAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except DnslookupAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_dnslookup.apiClient import DnslookupAPIClient

# Enable debug mode
api = DnslookupAPIClient("[YOUR_API_KEY]", debug=True)

query = {
    "domain": "myspace.com",
    "type": "A,MX,TXT"
}

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_dnslookup.apiClient import DnslookupAPIClient

api = DnslookupAPIClient("[YOUR_API_KEY]")

query = {
    "domain": "myspace.com",
    "type": "A,MX,TXT"
}

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
