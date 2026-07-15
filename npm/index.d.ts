declare module '@apiverve/dnslookup' {
  export interface dnslookupOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface dnslookupResponse {
    status: string;
    error: string | null;
    data: DNSLookupData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface DNSLookupData {
      domain:  null | string;
      records: Records;
      summary: Summary;
  }
  
  interface Records {
      a:   (null | string)[];
      mx:  MX[];
      ns:  (null | string)[];
      soa: SOA;
      txt: (null | string)[];
  }
  
  interface MX {
      exchange: null | string;
      priority: number | null;
  }
  
  interface SOA {
      nsname:     null | string;
      hostmaster: null | string;
      serial:     number | null;
      refresh:    number | null;
      retry:      number | null;
      expire:     number | null;
      minttl:     number | null;
  }
  
  interface Summary {
      hasIPv6:        boolean | null;
      hasMailServers: boolean | null;
      hasSPF:         boolean | null;
  }

  export default class dnslookupWrapper {
    constructor(options: dnslookupOptions);

    execute(callback: (error: any, data: dnslookupResponse | null) => void): Promise<dnslookupResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: dnslookupResponse | null) => void): Promise<dnslookupResponse>;
    execute(query?: Record<string, any>): Promise<dnslookupResponse>;
  }
}
