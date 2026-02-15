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
        /// The domain name for which you want to lookup the DNS records. Do not include the protocol, and not subdomains (e.g., myspace.com)
        /// </summary>
        [JsonProperty("domain")]
        public string Domain { get; set; }
    }
}
