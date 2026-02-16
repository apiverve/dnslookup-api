/// Response models for the DNS Lookup API.

/// API Response wrapper.
class DnslookupResponse {
  final String status;
  final dynamic error;
  final DnslookupData? data;

  DnslookupResponse({
    required this.status,
    this.error,
    this.data,
  });

  factory DnslookupResponse.fromJson(Map<String, dynamic> json) => DnslookupResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? DnslookupData.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
  };
}

/// Response data for the DNS Lookup API.

class DnslookupData {
  String? domain;
  DnslookupDataRecords? records;

  DnslookupData({
    this.domain,
    this.records,
  });

  factory DnslookupData.fromJson(Map<String, dynamic> json) => DnslookupData(
      domain: json['domain'],
      records: json['records'] != null ? DnslookupDataRecords.fromJson(json['records']) : null,
    );
}

class DnslookupDataRecords {
  List<String>? A;
  List<String>? NS;
  DnslookupDataRecordsSoa? SOA;
  List<DnslookupDataRecordsMxItem>? MX;
  List<DnslookupDataRecordsTxtItem>? TXT;

  DnslookupDataRecords({
    this.A,
    this.NS,
    this.SOA,
    this.MX,
    this.TXT,
  });

  factory DnslookupDataRecords.fromJson(Map<String, dynamic> json) => DnslookupDataRecords(
      A: (json['A'] as List?)?.cast<String>(),
      NS: (json['NS'] as List?)?.cast<String>(),
      SOA: json['SOA'] != null ? DnslookupDataRecordsSoa.fromJson(json['SOA']) : null,
      MX: (json['MX'] as List?)?.map((e) => DnslookupDataRecordsMxItem.fromJson(e)).toList(),
      TXT: (json['TXT'] as List?)?.map((e) => DnslookupDataRecordsTxtItem.fromJson(e)).toList(),
    );
}

class DnslookupDataRecordsSoa {
  String? nsname;
  String? hostmaster;
  int? serial;
  int? refresh;
  int? retry;
  int? expire;
  int? minttl;

  DnslookupDataRecordsSoa({
    this.nsname,
    this.hostmaster,
    this.serial,
    this.refresh,
    this.retry,
    this.expire,
    this.minttl,
  });

  factory DnslookupDataRecordsSoa.fromJson(Map<String, dynamic> json) => DnslookupDataRecordsSoa(
      nsname: json['nsname'],
      hostmaster: json['hostmaster'],
      serial: json['serial'],
      refresh: json['refresh'],
      retry: json['retry'],
      expire: json['expire'],
      minttl: json['minttl'],
    );
}

class DnslookupDataRecordsMxItem {
  String? exchange;
  int? priority;

  DnslookupDataRecordsMxItem({
    this.exchange,
    this.priority,
  });

  factory DnslookupDataRecordsMxItem.fromJson(Map<String, dynamic> json) => DnslookupDataRecordsMxItem(
      exchange: json['exchange'],
      priority: json['priority'],
    );
}

class DnslookupDataRecordsTxtItem {
  String? 0;

  DnslookupDataRecordsTxtItem({
    this.0,
  });

  factory DnslookupDataRecordsTxtItem.fromJson(Map<String, dynamic> json) => DnslookupDataRecordsTxtItem(
      0: json['0'],
    );
}

class DnslookupRequest {
  String domain;

  DnslookupRequest({
    required this.domain,
  });

  Map<String, dynamic> toJson() => {
      'domain': domain,
    };
}
