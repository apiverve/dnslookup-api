/// Response models for the DNS Lookup API.

/// API Response wrapper.
class DnslookupResponse {
  final String status;
  final dynamic error;
  final DnslookupData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  DnslookupResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory DnslookupResponse.fromJson(Map<String, dynamic> json) => DnslookupResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? DnslookupData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the DNS Lookup API.

class DnslookupData {
  String? domain;
  DnslookupDataRecords? records;
  DnslookupDataTtl? ttl;
  DnslookupDataSummary? summary;

  DnslookupData({
    this.domain,
    this.records,
    this.ttl,
    this.summary,
  });

  factory DnslookupData.fromJson(Map<String, dynamic> json) => DnslookupData(
      domain: json['domain'],
      records: json['records'] != null ? DnslookupDataRecords.fromJson(json['records']) : null,
      ttl: json['ttl'] != null ? DnslookupDataTtl.fromJson(json['ttl']) : null,
      summary: json['summary'] != null ? DnslookupDataSummary.fromJson(json['summary']) : null,
    );
}

class DnslookupDataRecords {
  List<String>? A;
  List<String>? AAAA;
  dynamic CNAME;
  List<DnslookupDataRecordsMxItem>? MX;
  List<String>? NS;
  dynamic PTR;
  dynamic SRV;
  DnslookupDataRecordsSoa? SOA;
  List<DnslookupDataRecordsTxtItem>? TXT;
  List<DnslookupDataRecordsCaaItem>? CAA;

  DnslookupDataRecords({
    this.A,
    this.AAAA,
    this.CNAME,
    this.MX,
    this.NS,
    this.PTR,
    this.SRV,
    this.SOA,
    this.TXT,
    this.CAA,
  });

  factory DnslookupDataRecords.fromJson(Map<String, dynamic> json) => DnslookupDataRecords(
      A: (json['A'] as List?)?.cast<String>(),
      AAAA: (json['AAAA'] as List?)?.cast<String>(),
      CNAME: json['CNAME'],
      MX: (json['MX'] as List?)?.map((e) => DnslookupDataRecordsMxItem.fromJson(e)).toList(),
      NS: (json['NS'] as List?)?.cast<String>(),
      PTR: json['PTR'],
      SRV: json['SRV'],
      SOA: json['SOA'] != null ? DnslookupDataRecordsSoa.fromJson(json['SOA']) : null,
      TXT: (json['TXT'] as List?)?.map((e) => DnslookupDataRecordsTxtItem.fromJson(e)).toList(),
      CAA: (json['CAA'] as List?)?.map((e) => DnslookupDataRecordsCaaItem.fromJson(e)).toList(),
    );
}

class DnslookupDataRecordsMxItem {
  String? exchange;
  num? priority;

  DnslookupDataRecordsMxItem({
    this.exchange,
    this.priority,
  });

  factory DnslookupDataRecordsMxItem.fromJson(Map<String, dynamic> json) => DnslookupDataRecordsMxItem(
      exchange: json['exchange'],
      priority: json['priority'],
    );
}

class DnslookupDataRecordsSoa {
  String? nsname;
  String? hostmaster;
  num? serial;
  num? refresh;
  num? retry;
  num? expire;
  num? minttl;

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

class DnslookupDataRecordsTxtItem {
  String? 0;

  DnslookupDataRecordsTxtItem({
    this.0,
  });

  factory DnslookupDataRecordsTxtItem.fromJson(Map<String, dynamic> json) => DnslookupDataRecordsTxtItem(
      0: json['0'],
    );
}

class DnslookupDataRecordsCaaItem {
  num? critical;
  String? issue;

  DnslookupDataRecordsCaaItem({
    this.critical,
    this.issue,
  });

  factory DnslookupDataRecordsCaaItem.fromJson(Map<String, dynamic> json) => DnslookupDataRecordsCaaItem(
      critical: json['critical'],
      issue: json['issue'],
    );
}

class DnslookupDataTtl {
  num? A;
  num? AAAA;
  dynamic CNAME;
  num? MX;
  num? NS;
  dynamic PTR;
  dynamic SRV;
  num? SOA;
  num? TXT;
  num? CAA;

  DnslookupDataTtl({
    this.A,
    this.AAAA,
    this.CNAME,
    this.MX,
    this.NS,
    this.PTR,
    this.SRV,
    this.SOA,
    this.TXT,
    this.CAA,
  });

  factory DnslookupDataTtl.fromJson(Map<String, dynamic> json) => DnslookupDataTtl(
      A: json['A'],
      AAAA: json['AAAA'],
      CNAME: json['CNAME'],
      MX: json['MX'],
      NS: json['NS'],
      PTR: json['PTR'],
      SRV: json['SRV'],
      SOA: json['SOA'],
      TXT: json['TXT'],
      CAA: json['CAA'],
    );
}

class DnslookupDataSummary {
  bool? hasIPv6;
  bool? hasMailServers;
  bool? hasSPF;

  DnslookupDataSummary({
    this.hasIPv6,
    this.hasMailServers,
    this.hasSPF,
  });

  factory DnslookupDataSummary.fromJson(Map<String, dynamic> json) => DnslookupDataSummary(
      hasIPv6: json['hasIPv6'],
      hasMailServers: json['hasMailServers'],
      hasSPF: json['hasSPF'],
    );
}

class DnslookupRequest {
  String domain;
  String? type;

  DnslookupRequest({
    required this.domain,
    this.type,
  });

  Map<String, dynamic> toJson() => {
      'domain': domain,
      if (type != null) 'type': type,
    };
}
