# DNS Lookup API

DNS Lookup retrieves published DNS records for any domain, including IPv4 (A), IPv6 (AAAA), and mail exchange (MX) servers. It provides hostnames, priorities, and dual-stack status flags, while paid plans add TXT, CNAME, and nameserver records.

[![npm version](https://img.shields.io/npm/v/@apiverve/dnslookup.svg)](https://www.npmjs.com/package/@apiverve/dnslookup)

This is a JavaScript wrapper for the [DNS Lookup API](https://apiverve.com/marketplace/dnslookup?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Installation

Using npm:
```shell
npm install @apiverve/dnslookup
```

Using yarn:
```shell
yarn add @apiverve/dnslookup
```

---

## Configuration

Before using the DNS Lookup API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Quick Start

[Get started with the Quick Start Guide](https://docs.apiverve.com/quickstart?utm_source=npm&utm_medium=referral&utm_content=readme)

The DNS Lookup API documentation is found here: [https://docs.apiverve.com/ref/dnslookup](https://docs.apiverve.com/ref/dnslookup?utm_source=npm&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```javascript
const dnslookupAPI = require('@apiverve/dnslookup');
const api = new dnslookupAPI({
    api_key: '[YOUR_API_KEY]'
});
```

---

## Usage

---

### Perform Request

Using the API is simple. All you have to do is make a request. The API will return a response with the data you requested.

```javascript
var query = {
  domain: "myspace.com",
  type: "A,MX,TXT"
};

api.execute(query, function (error, data) {
    if (error) {
        return console.error(error);
    } else {
        console.log(data);
    }
});
```

---

### Using Promises

You can also use promises to make requests. The API returns a promise that you can use to handle the response.

```javascript
var query = {
  domain: "myspace.com",
  type: "A,MX,TXT"
};

api.execute(query)
    .then(data => {
        console.log(data);
    })
    .catch(error => {
        console.error(error);
    });
```

---

### Using Async/Await

You can also use async/await to make requests. The API returns a promise that you can use to handle the response.

```javascript
async function makeRequest() {
    var query = {
  domain: "myspace.com",
  type: "A,MX,TXT"
};

    try {
        const data = await api.execute(query);
        console.log(data);
    } catch (error) {
        console.error(error);
    }
}
```

---

## Example Response

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

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## Updates

Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=npm&utm_medium=referral&utm_content=readme) and [Privacy Policy](https://apiverve.com/privacy?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
