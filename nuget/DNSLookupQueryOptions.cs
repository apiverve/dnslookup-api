using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.DNSLookup
{
    /// <summary>
    /// Query options for the DNS Lookup API
    /// </summary>
    public class DNSLookupQueryOptions
    {
        /// <summary>
        /// The domain or DNS name to look up, without the protocol. Underscore names work too, such as _dmarc.example.com or _sip._tcp.example.com
        /// </summary>
        [JsonProperty("domain")]
        public string Domain { get; set; }

        /// <summary>
        /// Comma-separated record types to look up. Leave it out for A, AAAA, CNAME, MX, NS, PTR, SRV, SOA, TXT and CAA. HTTPS, SVCB, TLSA, NAPTR, DS and DNSKEY are returned only when named here
        /// </summary>
        [JsonProperty("type")]
        public string Type { get; set; }
    }
}
