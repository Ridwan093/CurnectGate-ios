class GetUserProfile {
  GetUserProfile({
    required this.status,
    required this.message,
    required this.code,
    required this.data,
  });

  final bool? status;
  final String? message;
  final int? code;
  final Data? data;

  GetUserProfile copyWith({
    bool? status,
    String? message,
    int? code,
    Data? data,
  }) {
    return GetUserProfile(
      status: status ?? this.status,
      message: message ?? this.message,
      code: code ?? this.code,
      data: data ?? this.data,
    );
  }

  factory GetUserProfile.fromJson(Map<String, dynamic> json) {
    return GetUserProfile(
      status: json["status"],
      message: json["message"],
      code: json["code"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
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
  Data({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.memberCode,
    required this.estateCode,
    required this.estateName,
    required this.gender,
    required this.role,
    required this.status,
    required this.mediaUrl,
    required this.preferredNotification,
    required this.emailVerifiedAt,
    required this.lastLoginAt,
   
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? firstname;
  final String? lastname;
  final String? fullName;
  final String? email;
  final String? phone;
  final String? memberCode;
  final String? estateCode;
  final String? estateName;
  final dynamic gender;
  final String? role;
  final String? status;
  final String? mediaUrl;
  final String? preferredNotification;
  final dynamic emailVerifiedAt;
  final dynamic lastLoginAt;
 
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Data copyWith({
    int? id,
    String? firstname,
    String? lastname,
    String? fullName,
    String? email,
    String? phone,
    String? memberCode,
    String? estateCode,
    String? estateName,
    dynamic gender,
    String? role,
    String? status,
    String? mediaUrl,
    String? preferredNotification,
    dynamic emailVerifiedAt,
    dynamic lastLoginAt,
 
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Data(
      id: id ?? this.id,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      memberCode: memberCode ?? this.memberCode,
      estateCode: estateCode ?? this.estateCode,
      estateName: estateName ?? this.estateName,
      gender: gender ?? this.gender,
      role: role ?? this.role,
      status: status ?? this.status,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      preferredNotification:
          preferredNotification ?? this.preferredNotification,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,

      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(

      id: json["id"],
      firstname: json["firstname"],
      lastname: json["lastname"],
      fullName: json["full_name"],
      email: json["email"],
      phone: json["phone"],
      memberCode: json["member_code"],
      estateCode: json["estate_code"],
      estateName: json["estate_name"],
      gender: json["gender"],
      role: json["role"],
      status: json["status"],
      mediaUrl: json["media_url"],
      preferredNotification: json["preferred_notification"],
      emailVerifiedAt: json["email_verified_at"],
      lastLoginAt: json["last_login_at"],
     
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstname": firstname,
    "lastname": lastname,
    "full_name": fullName,
    "email": email,
    "phone": phone,
    "member_code": memberCode,
    "estate_code": estateCode,
    "estate_name": estateName,
    "gender": gender,
    "role": role,
    "status": status,
    "media_url": mediaUrl,
    "preferred_notification": preferredNotification,
    "email_verified_at": emailVerifiedAt,
    "last_login_at": lastLoginAt,

    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class HouseholdPermissions {
  HouseholdPermissions({
    required this.gateAccess,
    required this.nightAccess,
    required this.facilityAccess,
    required this.visitorInvitation,
  });

  final FacilityAccess? gateAccess;
  final NightAccess? nightAccess;
  final FacilityAccess? facilityAccess;
  final FacilityAccess? visitorInvitation;

  HouseholdPermissions copyWith({
    FacilityAccess? gateAccess,
    NightAccess? nightAccess,
    FacilityAccess? facilityAccess,
    FacilityAccess? visitorInvitation,
  }) {
    return HouseholdPermissions(
      gateAccess: gateAccess ?? this.gateAccess,
      nightAccess: nightAccess ?? this.nightAccess,
      facilityAccess: facilityAccess ?? this.facilityAccess,
      visitorInvitation: visitorInvitation ?? this.visitorInvitation,
    );
  }

  factory HouseholdPermissions.fromJson(Map<String, dynamic> json) {
    return HouseholdPermissions(
      gateAccess:
          json["gate_access"] == null
              ? null
              : FacilityAccess.fromJson(json["gate_access"]),
      nightAccess:
          json["night_access"] == null
              ? null
              : NightAccess.fromJson(json["night_access"]),
      facilityAccess:
          json["facility_access"] == null
              ? null
              : FacilityAccess.fromJson(json["facility_access"]),
      visitorInvitation:
          json["visitor_invitation"] == null
              ? null
              : FacilityAccess.fromJson(json["visitor_invitation"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "gate_access": gateAccess?.toJson(),
    "night_access": nightAccess?.toJson(),
    "facility_access": facilityAccess?.toJson(),
    "visitor_invitation": visitorInvitation?.toJson(),
  };
}

class FacilityAccess {
  FacilityAccess({required this.enabled});

  final bool? enabled;

  FacilityAccess copyWith({bool? enabled}) {
    return FacilityAccess(enabled: enabled ?? this.enabled);
  }

  factory FacilityAccess.fromJson(Map<String, dynamic> json) {
    return FacilityAccess(enabled: json["enabled"]);
  }

  Map<String, dynamic> toJson() => {"enabled": enabled};
}

class NightAccess {
  NightAccess({required this.enabled, required this.conditions});

  final bool? enabled;
  final Conditions? conditions;

  NightAccess copyWith({bool? enabled, Conditions? conditions}) {
    return NightAccess(
      enabled: enabled ?? this.enabled,
      conditions: conditions ?? this.conditions,
    );
  }

  factory NightAccess.fromJson(Map<String, dynamic> json) {
    return NightAccess(
      enabled: json["enabled"],
      conditions:
          json["conditions"] == null
              ? null
              : Conditions.fromJson(json["conditions"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "enabled": enabled,
    "conditions": conditions?.toJson(),
  };
}

class Conditions {
  Conditions({required this.timeRestrictions});

  final List<dynamic> timeRestrictions;

  Conditions copyWith({List<dynamic>? timeRestrictions}) {
    return Conditions(
      timeRestrictions: timeRestrictions ?? this.timeRestrictions,
    );
  }

  factory Conditions.fromJson(Map<String, dynamic> json) {
    return Conditions(
      timeRestrictions:
          json["time_restrictions"] == null
              ? []
              : List<dynamic>.from(json["time_restrictions"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "time_restrictions": timeRestrictions.map((x) => x).toList(),
  };
}

class Notification {
  Notification({
    required this.key,
    required this.name,
    required this.type,
    required this.value,
    required this.description,
  });

  final String? key;
  final String? name;
  final String? type;
  final bool? value;
  final String? description;

  Notification copyWith({
    String? key,
    String? name,
    String? type,
    bool? value,
    String? description,
  }) {
    return Notification(
      key: key ?? this.key,
      name: name ?? this.name,
      type: type ?? this.type,
      value: value ?? this.value,
      description: description ?? this.description,
    );
  }

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      key: json["key"],
      name: json["name"],
      type: json["type"],
      value: json["value"],
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson() => {
    "key": key,
    "name": name,
    "type": type,
    "value": value,
    "description": description,
  };
}

class Preference {
  Preference({
    required this.key,
    required this.name,
    required this.type,
    required this.value,
    required this.options,
    required this.description,
  });

  final String? key;
  final String? name;
  final String? type;
  final String? value;
  final List<Option> options;
  final String? description;

  Preference copyWith({
    String? key,
    String? name,
    String? type,
    String? value,
    List<Option>? options,
    String? description,
  }) {
    return Preference(
      key: key ?? this.key,
      name: name ?? this.name,
      type: type ?? this.type,
      value: value ?? this.value,
      options: options ?? this.options,
      description: description ?? this.description,
    );
  }

  factory Preference.fromJson(Map<String, dynamic> json) {
    return Preference(
      key: json["key"],
      name: json["name"],
      type: json["type"],
      value: json["value"],
      options:
          json["options"] == null
              ? []
              : List<Option>.from(
                json["options"]!.map((x) => Option.fromJson(x)),
              ),
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson() => {
    "key": key,
    "name": name,
    "type": type,
    "value": value,
    "options": options.map((x) => x.toJson()).toList(),
    "description": description,
  };
}

class Option {
  Option({required this.key, required this.name});

  final String? key;
  final String? name;

  Option copyWith({String? key, String? name}) {
    return Option(key: key ?? this.key, name: name ?? this.name);
  }

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(key: json["key"], name: json["name"]);
  }

  Map<String, dynamic> toJson() => {"key": key, "name": name};
}
