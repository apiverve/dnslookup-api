DNS Lookup API
============

DNS Lookup retrieves published DNS records for any domain, including IPv4 (A), IPv6 (AAAA), and mail exchange (MX) servers. It provides hostnames, priorities, and dual-stack status flags, while paid plans add TXT, CNAME, and nameserver records.


[![NuGet version](https://img.shields.io/nuget/v/APIVerve.API.DNSLookup.svg)](https://www.nuget.org/packages/APIVerve.API.DNSLookup)

This is a .NET wrapper for the [DNS Lookup API](https://apiverve.com/marketplace/dnslookup?utm_source=nuget&utm_medium=referral&utm_content=readme)

---

## Installation

Using the .NET CLI:
```
dotnet add package APIVerve.API.DNSLookup
```

Using the Package Manager:
```
nuget install APIVerve.API.DNSLookup
```

Using the Package Manager Console:
```
Install-Package APIVerve.API.DNSLookup
```

From within Visual Studio:

1. Open the Solution Explorer
2. Right-click on a project within your solution
3. Click on Manage NuGet Packages
4. Click on the Browse tab and search for "APIVerve.API.DNSLookup"
5. Click on the APIVerve.API.DNSLookup package, select the appropriate version in the right-tab and click Install

---

## Configuration

Before using the DNS Lookup API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=nuget&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```csharp
using System;
using APIVerve.API.DNSLookup;

class Program
{
    static async Task Main(string[] args)
    {
        // Initialize the API client
        var apiClient = new DNSLookupAPIClient("[YOUR_API_KEY]");

        var queryOptions = new DNSLookupQueryOptions {
            Domain = "myspace.com",
            Type = "A,MX,TXT"
        };

        // Make the API call
        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                // Access response data using the strongly-typed ResponseObj properties
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Exception: {ex.Message}");
        }
    }
}
```

---

## Usage

The DNS Lookup API documentation is found here: [https://docs.apiverve.com/ref/dnslookup](https://docs.apiverve.com/ref/dnslookup?utm_source=nuget&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

###### Authentication
DNS Lookup API uses API Key-based authentication. When you create an instance of the API client, you can pass your API Key as a parameter.

```csharp
// Create an instance of the API client
var apiClient = new DNSLookupAPIClient("[YOUR_API_KEY]");
```

---

## Usage Examples

### Basic Usage (Async/Await Pattern - Recommended)

The modern async/await pattern provides the best performance and code readability:

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.DNSLookup;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new DNSLookupAPIClient("[YOUR_API_KEY]");

        var queryOptions = new DNSLookupQueryOptions {
            Domain = "myspace.com",
            Type = "A,MX,TXT"
        };

        var response = await apiClient.ExecuteAsync(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

### Synchronous Usage

If you need to use synchronous code, you can use the `Execute` method:

```csharp
using System;
using APIVerve.API.DNSLookup;

public class Example
{
    public static void Main(string[] args)
    {
        var apiClient = new DNSLookupAPIClient("[YOUR_API_KEY]");

        var queryOptions = new DNSLookupQueryOptions {
            Domain = "myspace.com",
            Type = "A,MX,TXT"
        };

        var response = apiClient.Execute(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

---

## Error Handling

The API client provides comprehensive error handling. Here are some examples:

### Handling API Errors

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.DNSLookup;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new DNSLookupAPIClient("[YOUR_API_KEY]");

        var queryOptions = new DNSLookupQueryOptions {
            Domain = "myspace.com",
            Type = "A,MX,TXT"
        };

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            // Check for API-level errors
            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
                Console.WriteLine($"Status: {response.Status}");
                return;
            }

            // Success - use the data
            Console.WriteLine("Request successful!");
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
        catch (ArgumentException ex)
        {
            // Invalid API key or parameters
            Console.WriteLine($"Invalid argument: {ex.Message}");
        }
        catch (System.Net.Http.HttpRequestException ex)
        {
            // Network or HTTP errors
            Console.WriteLine($"Network error: {ex.Message}");
        }
        catch (Exception ex)
        {
            // Other errors
            Console.WriteLine($"Unexpected error: {ex.Message}");
        }
    }
}
```

### Comprehensive Error Handling with Retry Logic

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.DNSLookup;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new DNSLookupAPIClient("[YOUR_API_KEY]");

        // Configure retry behavior (max 3 retries)
        apiClient.SetMaxRetries(3);        // Retry up to 3 times (default: 0, max: 3)
        apiClient.SetRetryDelay(2000);     // Wait 2 seconds between retries

        var queryOptions = new DNSLookupQueryOptions {
            Domain = "myspace.com",
            Type = "A,MX,TXT"
        };

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Failed after retries: {ex.Message}");
        }
    }
}
```

---

## Advanced Features

### Custom Headers

Add custom headers to your requests:

```csharp
var apiClient = new DNSLookupAPIClient("[YOUR_API_KEY]");

// Add custom headers
apiClient.AddCustomHeader("X-Custom-Header", "custom-value");
apiClient.AddCustomHeader("X-Request-ID", Guid.NewGuid().ToString());

var queryOptions = new DNSLookupQueryOptions {
    Domain = "myspace.com",
    Type = "A,MX,TXT"
};

var response = await apiClient.ExecuteAsync(queryOptions);

// Remove a header
apiClient.RemoveCustomHeader("X-Custom-Header");

// Clear all custom headers
apiClient.ClearCustomHeaders();
```

### Request Logging

Enable logging for debugging:

```csharp
var apiClient = new DNSLookupAPIClient("[YOUR_API_KEY]", isDebug: true);

// Or use a custom logger
apiClient.SetLogger(message =>
{
    Console.WriteLine($"[LOG] {DateTime.Now:yyyy-MM-dd HH:mm:ss} - {message}");
});

var queryOptions = new DNSLookupQueryOptions {
    Domain = "myspace.com",
    Type = "A,MX,TXT"
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Retry Configuration

Customize retry behavior for failed requests:

```csharp
var apiClient = new DNSLookupAPIClient("[YOUR_API_KEY]");

// Set retry options
apiClient.SetMaxRetries(3);           // Retry up to 3 times (default: 0, max: 3)
apiClient.SetRetryDelay(1500);        // Wait 1.5 seconds between retries (default: 1000ms)

var queryOptions = new DNSLookupQueryOptions {
    Domain = "myspace.com",
    Type = "A,MX,TXT"
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Dispose Pattern

The API client implements `IDisposable` for proper resource cleanup:

```csharp
var queryOptions = new DNSLookupQueryOptions {
    Domain = "myspace.com",
    Type = "A,MX,TXT"
};

using (var apiClient = new DNSLookupAPIClient("[YOUR_API_KEY]"))
{
    var response = await apiClient.ExecuteAsync(queryOptions);
    Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
}
// HttpClient is automatically disposed here
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

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=nuget&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=nuget&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
