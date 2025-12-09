declare module '@apiverve/dnslookup' {
  export interface dnslookupOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface dnslookupResponse {
    status: string;
    error: string | null;
    data: DNSLookupData;
    code?: number;
  }


  interface DNSLookupData {
      domain:  string;
      records: Records;
  }
  
  interface Records {
      a:   string[];
      ns:  string[];
      soa: SOA;
      mx:  MX[];
      txt: Array<string[]>;
  }
  
  interface MX {
      exchange: string;
      priority: number;
  }
  
  interface SOA {
      nsname:     string;
      hostmaster: string;
      serial:     number;
      refresh:    number;
      retry:      number;
      expire:     number;
      minttl:     number;
  }

  export default class dnslookupWrapper {
    constructor(options: dnslookupOptions);

    execute(callback: (error: any, data: dnslookupResponse | null) => void): Promise<dnslookupResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: dnslookupResponse | null) => void): Promise<dnslookupResponse>;
    execute(query?: Record<string, any>): Promise<dnslookupResponse>;
  }
}
