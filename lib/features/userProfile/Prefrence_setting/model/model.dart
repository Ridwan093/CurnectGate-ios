class GetuserNotifications {
  GetuserNotifications({
    required this.status,
    required this.message,
    required this.code,
    required this.data,
  });

  final bool? status;
  final String? message;
  final int? code;
  final PreferenceData? data;

  factory GetuserNotifications.fromJson(Map<String, dynamic> json) {
    return GetuserNotifications(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: json['data'] == null ? null : PreferenceData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'code': code,
    'data': data?.toJson(),
  };
}

class PreferenceData {
  PreferenceData({this.preferences});

  final Preferences? preferences;

  factory PreferenceData.fromJson(Map<String, dynamic> json) {
    return PreferenceData(
      preferences:
          json['preferences'] == null
              ? null
              : Preferences.fromJson(json['preferences']),
    );
  }

  Map<String, dynamic> toJson() => {'preferences': preferences?.toJson()};
}

class Preferences {
  Preferences({this.currency, this.language, this.timezone, this.dateFormat});

  final Preference? currency;
  final Preference? language;
  final Preference? timezone;
  final Preference? dateFormat;

  factory Preferences.fromJson(Map<String, dynamic> json) {
    return Preferences(
      currency:
          json['currency'] == null
              ? null
              : Preference.fromJson(json['currency']),
      language:
          json['language'] == null
              ? null
              : Preference.fromJson(json['language']),
      timezone:
          json['timezone'] == null
              ? null
              : Preference.fromJson(json['timezone']),
      dateFormat:
          json['date_format'] == null
              ? null
              : Preference.fromJson(json['date_format']),
    );
  }

  Map<String, dynamic> toJson() => {
    'currency': currency?.toJson(),
    'language': language?.toJson(),
    'timezone': timezone?.toJson(),
    'date_format': dateFormat?.toJson(),
  };
}

class Preference {
  Preference({
    this.name,
    this.description,
    this.type,
    this.options,
    this.key,
    this.value,
  });

  final String? name;
  final String? description;
  final String? type;
  final List<Option>? options; // nullable to allow absence for `timezone`
  final String? key;
  final String? value;

  factory Preference.fromJson(Map<String, dynamic> json) {
    return Preference(
      name: json['name'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      key: json['key'] as String?,
      value: json['value'] as String?,
      options:
          (json['options'] != null && json['options'] is List)
              ? List<Option>.from(
                json['options'].map((x) => Option.fromJson(x)),
              )
              : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'type': type,
    'key': key,
    'value': value,
    if (options != null) 'options': options?.map((x) => x.toJson()).toList(),
  };
}

class Option {
  Option({this.key, this.name});

  final String? key;
  final String? name;

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(key: json['key'] as String?, name: json['name'] as String?);
  }

  Map<String, dynamic> toJson() => {'key': key, 'name': name};
}
