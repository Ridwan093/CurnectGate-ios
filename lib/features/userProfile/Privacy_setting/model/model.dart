class GetUserPrivacySettings {
  GetUserPrivacySettings({this.status, this.message, this.code, this.data});

  final bool? status;
  final String? message;
  final int? code;
  final Data? data;

  factory GetUserPrivacySettings.fromJson(Map<String, dynamic> json) {
    return GetUserPrivacySettings(
      status: json["status"] as bool?,
      message: json["message"] as String?,
      code: json["code"] as int?,
      data: json["data"] != null ? Data.fromJson(json["data"]) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
    "data": data?.toJson(),
  };
}

class Data {
  Data({this.privacy});

  final Privacy? privacy;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      privacy:
          json["privacy"] != null ? Privacy.fromJson(json["privacy"]) : null,
    );
  }

  Map<String, dynamic> toJson() => {"privacy": privacy?.toJson()};
}

class Privacy {
  Privacy({this.showEmail, this.showPhone, this.profileVisibility});

  final ProfileVisibility? showEmail;
  final ProfileVisibility? showPhone;
  final ProfileVisibility? profileVisibility;

  factory Privacy.fromJson(Map<String, dynamic> json) {
    return Privacy(
      showEmail:
          json["show_email"] != null
              ? ProfileVisibility.fromJson(json["show_email"])
              : null,
      showPhone:
          json["show_phone"] != null
              ? ProfileVisibility.fromJson(json["show_phone"])
              : null,
      profileVisibility:
          json["profile_visibility"] != null
              ? ProfileVisibility.fromJson(json["profile_visibility"])
              : null,
    );
  }

  Map<String, dynamic> toJson() => {
    "show_email": showEmail?.toJson(),
    "show_phone": showPhone?.toJson(),
    "profile_visibility": profileVisibility?.toJson(),
  };
}

class ProfileVisibility {
  ProfileVisibility({
    this.name,
    this.description,
    this.type,
    this.key,
    this.value,
  });

  final String? name;
  final String? description;
  final String? type;
  final String? key;
  final bool? value;

  factory ProfileVisibility.fromJson(Map<String, dynamic> json) {
    return ProfileVisibility(
      name: json["name"] as String?,
      description: json["description"] as String?,
      type: json["type"] as String?,
      key: json["key"] as String?,
      value: json["value"] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "type": type,
    "key": key,
    "value": value,
  };
}
