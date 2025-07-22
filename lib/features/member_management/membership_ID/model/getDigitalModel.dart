class DigitalMemberIdResponse {
  final bool status;
  final String message;
  final int code;
  final DigitalMemberIdData data;

  DigitalMemberIdResponse({
    required this.status,
    required this.message,
    required this.code,
    required this.data,
  });

  factory DigitalMemberIdResponse.fromJson(Map<String, dynamic> json) {
    return DigitalMemberIdResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      code: json['code'] ?? 0,
      data: DigitalMemberIdData.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'code': code,
      'data': data.toJson(),
    };
  }
}

class DigitalMemberIdData {
  final DigitalId digitalId;
  final User user;
  final Estate estate;
  final String qrCodeUrl;
  final String formattedId;
  final String generatedAt;
  final String status;

  DigitalMemberIdData({
    required this.digitalId,
    required this.user,
    required this.estate,
    required this.qrCodeUrl,
    required this.formattedId,
    required this.generatedAt,
    required this.status,
  });

  factory DigitalMemberIdData.fromJson(Map<String, dynamic> json) {
    return DigitalMemberIdData(
      digitalId: DigitalId.fromJson(json['digital_id'] ?? {}),
      user: User.fromJson(json['user'] ?? {}),
      estate: Estate.fromJson(json['estate'] ?? {}),
      qrCodeUrl: json['qr_code_url'] ?? '',
      formattedId: json['formatted_id'] ?? '',
      generatedAt: json['generated_at'] ?? '',
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'digital_id': digitalId.toJson(),
      'user': user.toJson(),
      'estate': estate.toJson(),
      'qr_code_url': qrCodeUrl,
      'formatted_id': formattedId,
      'generated_at': generatedAt,
      'status': status,
    };
  }
}

class DigitalId {
  final int id;
  final int userId;
  final int estateId;
  final String digitalIdCode;
  final String qrCodeUrl;
  final String qrCodePublicId;
  final String qrCodeData;
  final String status;
  final AccessPermissions accessPermissions;
  final dynamic restrictions;
  final dynamic deactivationReason;
  final int deactivatedBy;
  final int createdBy;
  final String activatedAt;
  final dynamic deactivatedAt;
  final String lastUsedAt;
  final int usageCount;
  final String createdAt;
  final String updatedAt;

  DigitalId({
    required this.id,
    required this.userId,
    required this.estateId,
    required this.digitalIdCode,
    required this.qrCodeUrl,
    required this.qrCodePublicId,
    required this.qrCodeData,
    required this.status,
    required this.accessPermissions,
    required this.restrictions,
    required this.deactivationReason,
    required this.deactivatedBy,
    required this.createdBy,
    required this.activatedAt,
    required this.deactivatedAt,
    required this.lastUsedAt,
    required this.usageCount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DigitalId.fromJson(Map<String, dynamic> json) {
    return DigitalId(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      estateId: json['estate_id'] ?? 0,
      digitalIdCode: json['digital_id_code'] ?? '',
      qrCodeUrl: json['qr_code_url'] ?? '',
      qrCodePublicId: json['qr_code_public_id'] ?? '',
      qrCodeData: json['qr_code_data'] ?? '',
      status: json['status'] ?? '',
      accessPermissions: AccessPermissions.fromJson(json['access_permissions'] ?? {}),
      restrictions: json['restrictions'],
      deactivationReason: json['deactivation_reason'],
      deactivatedBy: json['deactivated_by'] ?? 0,
      createdBy: json['created_by'] ?? 0,
      activatedAt: json['activated_at'] ?? '',
      deactivatedAt: json['deactivated_at'],
      lastUsedAt: json['last_used_at'] ?? '',
      usageCount: json['usage_count'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'estate_id': estateId,
      'digital_id_code': digitalIdCode,
      'qr_code_url': qrCodeUrl,
      'qr_code_public_id': qrCodePublicId,
      'qr_code_data': qrCodeData,
      'status': status,
      'access_permissions': accessPermissions.toJson(),
      'restrictions': restrictions,
      'deactivation_reason': deactivationReason,
      'deactivated_by': deactivatedBy,
      'created_by': createdBy,
      'activated_at': activatedAt,
      'deactivated_at': deactivatedAt,
      'last_used_at': lastUsedAt,
      'usage_count': usageCount,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class AccessPermissions {
  final bool gateAccess;
  final bool nightAccess;
  final bool facilityAccess;
  final bool emergencyAccess;

  AccessPermissions({
    required this.gateAccess,
    required this.nightAccess,
    required this.facilityAccess,
    required this.emergencyAccess,
  });

  factory AccessPermissions.fromJson(Map<String, dynamic> json) {
    return AccessPermissions(
      gateAccess: json['gate_access'] ?? false,
      nightAccess: json['night_access'] ?? false,
      facilityAccess: json['facility_access'] ?? false,
      emergencyAccess: json['emergency_access'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gate_access': gateAccess,
      'night_access': nightAccess,
      'facility_access': facilityAccess,
      'emergency_access': emergencyAccess,
    };
  }
}

class User {
  final int id;
  final String firstname;
  final String lastname;
  final String email;
  final String phone;
  final String memberCode;
  final String mediaUrl;
  final String mediaKey;
  final String estateCode;
  final String estateName;
  final int estateId;
  final dynamic dob;
  final String status;
  final dynamic address;
  final dynamic gender;
  final String digitalIdCode;
  final dynamic digitalQrCode;
  final bool digitalIdStatus;
  final dynamic signature;
  final bool deedOfAgreementSign;
  final dynamic emailVerifiedAt;
  final dynamic verificationCodeExpiresAt;
  final bool isServiceProvider;
  final bool passwordChangeRequired;
  final String role;
  final String preferredNotification;
  final bool agreeToTerms;
  final UserSettings settings;
  final dynamic curfewSettings;
  final dynamic lastLoginAt;
  final dynamic profileImageUrl;
  final dynamic profileImageKey;
  final String createdAt;
  final String updatedAt;

  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.memberCode,
    required this.mediaUrl,
    required this.mediaKey,
    required this.estateCode,
    required this.estateName,
    required this.estateId,
    required this.dob,
    required this.status,
    required this.address,
    required this.gender,
    required this.digitalIdCode,
    required this.digitalQrCode,
    required this.digitalIdStatus,
    required this.signature,
    required this.deedOfAgreementSign,
    required this.emailVerifiedAt,
    required this.verificationCodeExpiresAt,
    required this.isServiceProvider,
    required this.passwordChangeRequired,
    required this.role,
    required this.preferredNotification,
    required this.agreeToTerms,
    required this.settings,
    required this.curfewSettings,
    required this.lastLoginAt,
    required this.profileImageUrl,
    required this.profileImageKey,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      firstname: json['firstname'] ?? '',
      lastname: json['lastname'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      memberCode: json['member_code'] ?? '',
      mediaUrl: json['media_url'] ?? '',
      mediaKey: json['media_key'] ?? '',
      estateCode: json['estate_code'] ?? '',
      estateName: json['estate_name'] ?? '',
      estateId: json['estate_id'] ?? 0,
      dob: json['dob'],
      status: json['status'] ?? '',
      address: json['address'],
      gender: json['gender'],
      digitalIdCode: json['digital_id_code'] ?? '',
      digitalQrCode: json['digital_qr_code'],
      digitalIdStatus: json['digital_id_status'] ?? false,
      signature: json['signature'],
      deedOfAgreementSign: json['deed_of_agreement_sign'] ?? false,
      emailVerifiedAt: json['email_verified_at'],
      verificationCodeExpiresAt: json['verification_code_expires_at'],
      isServiceProvider: json['is_service_provider'] ?? false,
      passwordChangeRequired: json['password_change_required'] ?? false,
      role: json['role'] ?? '',
      preferredNotification: json['preferred_notification'] ?? '',
      agreeToTerms: json['agree_to_terms'] ?? false,
      settings: UserSettings.fromJson(json['settings'] ?? {}),
      curfewSettings: json['curfew_settings'],
      lastLoginAt: json['last_login_at'],
      profileImageUrl: json['profile_image_url'],
      profileImageKey: json['profile_image_key'],
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'phone': phone,
      'member_code': memberCode,
      'media_url': mediaUrl,
      'media_key': mediaKey,
      'estate_code': estateCode,
      'estate_name': estateName,
      'estate_id': estateId,
      'dob': dob,
      'status': status,
      'address': address,
      'gender': gender,
      'digital_id_code': digitalIdCode,
      'digital_qr_code': digitalQrCode,
      'digital_id_status': digitalIdStatus,
      'signature': signature,
      'deed_of_agreement_sign': deedOfAgreementSign,
      'email_verified_at': emailVerifiedAt,
      'verification_code_expires_at': verificationCodeExpiresAt,
      'is_service_provider': isServiceProvider,
      'password_change_required': passwordChangeRequired,
      'role': role,
      'preferred_notification': preferredNotification,
      'agree_to_terms': agreeToTerms,
      'settings': settings.toJson(),
      'curfew_settings': curfewSettings,
      'last_login_at': lastLoginAt,
      'profile_image_url': profileImageUrl,
      'profile_image_key': profileImageKey,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class UserSettings {
  final PrivacySettings privacy;
  final dynamic bankName;
  final Preferences preferences;
  final Notifications notifications;
  final dynamic bankAccountName;
  final dynamic bankAccountNumber;
  final HouseholdPermissions householdPermissions;
  final String preferredPaymentMethod;

  UserSettings({
    required this.privacy,
    required this.bankName,
    required this.preferences,
    required this.notifications,
    required this.bankAccountName,
    required this.bankAccountNumber,
    required this.householdPermissions,
    required this.preferredPaymentMethod,
  });

  factory UserSettings.fromJson(Map<String, dynamic> json) {
    return UserSettings(
      privacy: PrivacySettings.fromJson(json['privacy'] ?? {}),
      bankName: json['bank_name'],
      preferences: Preferences.fromJson(json['preferences'] ?? {}),
      notifications: Notifications.fromJson(json['notifications'] ?? {}),
      bankAccountName: json['bank_account_name'],
      bankAccountNumber: json['bank_account_number'],
      householdPermissions: HouseholdPermissions.fromJson(json['household_permissions'] ?? {}),
      preferredPaymentMethod: json['preferred_payment_method'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'privacy': privacy.toJson(),
      'bank_name': bankName,
      'preferences': preferences.toJson(),
      'notifications': notifications.toJson(),
      'bank_account_name': bankAccountName,
      'bank_account_number': bankAccountNumber,
      'household_permissions': householdPermissions.toJson(),
      'preferred_payment_method': preferredPaymentMethod,
    };
  }
}

class PrivacySettings {
  final bool showEmail;
  final bool showPhone;
  final bool profileVisibility;

  PrivacySettings({
    required this.showEmail,
    required this.showPhone,
    required this.profileVisibility,
  });

  factory PrivacySettings.fromJson(Map<String, dynamic> json) {
    return PrivacySettings(
      showEmail: json['show_email'] ?? false,
      showPhone: json['show_phone'] ?? false,
      profileVisibility: json['profile_visibility'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'show_email': showEmail,
      'show_phone': showPhone,
      'profile_visibility': profileVisibility,
    };
  }
}

class Preferences {
  final String currency;
  final String language;
  final String timezone;
  final String dateFormat;

  Preferences({
    required this.currency,
    required this.language,
    required this.timezone,
    required this.dateFormat,
  });

  factory Preferences.fromJson(Map<String, dynamic> json) {
    return Preferences(
      currency: json['currency'] ?? '',
      language: json['language'] ?? '',
      timezone: json['timezone'] ?? '',
      dateFormat: json['date_format'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currency': currency,
      'language': language,
      'timezone': timezone,
      'date_format': dateFormat,
    };
  }
}

class Notifications {
  final bool sms;
  final bool push;
  final bool email;
  final bool payments;
  final bool security;
  final bool community;
  final bool maintenance;
  final bool communityUpdates;
  final bool paymentReminders;
  final bool maintenanceAlerts;

  Notifications({
    required this.sms,
    required this.push,
    required this.email,
    required this.payments,
    required this.security,
    required this.community,
    required this.maintenance,
    required this.communityUpdates,
    required this.paymentReminders,
    required this.maintenanceAlerts,
  });

  factory Notifications.fromJson(Map<String, dynamic> json) {
    return Notifications(
      sms: json['sms'] ?? false,
      push: json['push'] ?? false,
      email: json['email'] ?? false,
      payments: json['payments'] ?? false,
      security: json['security'] ?? false,
      community: json['community'] ?? false,
      maintenance: json['maintenance'] ?? false,
      communityUpdates: json['community_updates'] ?? false,
      paymentReminders: json['payment_reminders'] ?? false,
      maintenanceAlerts: json['maintenance_alerts'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sms': sms,
      'push': push,
      'email': email,
      'payments': payments,
      'security': security,
      'community': community,
      'maintenance': maintenance,
      'community_updates': communityUpdates,
      'payment_reminders': paymentReminders,
      'maintenance_alerts': maintenanceAlerts,
    };
  }
}

class HouseholdPermissions {
  final GateAccess gateAccess;
  final NightAccess nightAccess;
  final FacilityAccess facilityAccess;
  final VisitorInvitation visitorInvitation;

  HouseholdPermissions({
    required this.gateAccess,
    required this.nightAccess,
    required this.facilityAccess,
    required this.visitorInvitation,
  });

  factory HouseholdPermissions.fromJson(Map<String, dynamic> json) {
    return HouseholdPermissions(
      gateAccess: GateAccess.fromJson(json['gate_access'] ?? {}),
      nightAccess: NightAccess.fromJson(json['night_access'] ?? {}),
      facilityAccess: FacilityAccess.fromJson(json['facility_access'] ?? {}),
      visitorInvitation: VisitorInvitation.fromJson(json['visitor_invitation'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gate_access': gateAccess.toJson(),
      'night_access': nightAccess.toJson(),
      'facility_access': facilityAccess.toJson(),
      'visitor_invitation': visitorInvitation.toJson(),
    };
  }
}

class GateAccess {
  final bool enabled;

  GateAccess({
    required this.enabled,
  });

  factory GateAccess.fromJson(Map<String, dynamic> json) {
    return GateAccess(
      enabled: json['enabled'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'enabled': enabled,
    };
  }
}

class NightAccess {
  final bool enabled;
  final Conditions conditions;

  NightAccess({
    required this.enabled,
    required this.conditions,
  });

  factory NightAccess.fromJson(Map<String, dynamic> json) {
    return NightAccess(
      enabled: json['enabled'] ?? false,
      conditions: Conditions.fromJson(json['conditions'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'enabled': enabled,
      'conditions': conditions.toJson(),
    };
  }
}

class Conditions {
  final List<dynamic> timeRestrictions;

  Conditions({
    required this.timeRestrictions,
  });

  factory Conditions.fromJson(Map<String, dynamic> json) {
    return Conditions(
      timeRestrictions: json['time_restrictions'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time_restrictions': timeRestrictions,
    };
  }
}

class FacilityAccess {
  final bool enabled;

  FacilityAccess({
    required this.enabled,
  });

  factory FacilityAccess.fromJson(Map<String, dynamic> json) {
    return FacilityAccess(
      enabled: json['enabled'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'enabled': enabled,
    };
  }
}

class VisitorInvitation {
  final bool enabled;

  VisitorInvitation({
    required this.enabled,
  });

  factory VisitorInvitation.fromJson(Map<String, dynamic> json) {
    return VisitorInvitation(
      enabled: json['enabled'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'enabled': enabled,
    };
  }
}

class Estate {
  final int id;
  final String name;
  final int onboardedBy;
  final String address;
  final String estateCode;
  final int stateId;
  final String city;
  final String postalCode;
  final String contactEmail;
  final String contactPhone;
  final EstateSettings settings;
  final String status;
  final dynamic mediaUrl;
  final dynamic mediaKey;
  final String createdAt;
  final String updatedAt;
  final Pivot pivot;

  Estate({
    required this.id,
    required this.name,
    required this.onboardedBy,
    required this.address,
    required this.estateCode,
    required this.stateId,
    required this.city,
    required this.postalCode,
    required this.contactEmail,
    required this.contactPhone,
    required this.settings,
    required this.status,
    required this.mediaUrl,
    required this.mediaKey,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  factory Estate.fromJson(Map<String, dynamic> json) {
    return Estate(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      onboardedBy: json['onboarded_by'] ?? 0,
      address: json['address'] ?? '',
      estateCode: json['estate_code'] ?? '',
      stateId: json['state_id'] ?? 0,
      city: json['city'] ?? '',
      postalCode: json['postal_code'] ?? '',
      contactEmail: json['contact_email'] ?? '',
      contactPhone: json['contact_phone'] ?? '',
      settings: EstateSettings.fromJson(json['settings'] ?? {}),
      status: json['status'] ?? '',
      mediaUrl: json['media_url'],
      mediaKey: json['media_key'],
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      pivot: Pivot.fromJson(json['pivot'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'onboarded_by': onboardedBy,
      'address': address,
      'estate_code': estateCode,
      'state_id': stateId,
      'city': city,
      'postal_code': postalCode,
      'contact_email': contactEmail,
      'contact_phone': contactPhone,
      'settings': settings.toJson(),
      'status': status,
      'media_url': mediaUrl,
      'media_key': mediaKey,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'pivot': pivot.toJson(),
    };
  }
}

class EstateSettings {
  final bool autoApproveUsers;
  final bool requireDeedSignature;
  final bool visitorApprovalRequired;
  final List<dynamic> emergencyContacts;
  final String imageUrl;
  final String imageKey;
  final OperatingHours operatingHours;
  final String imageKey2;

  EstateSettings({
    required this.autoApproveUsers,
    required this.requireDeedSignature,
    required this.visitorApprovalRequired,
    required this.emergencyContacts,
    required this.imageUrl,
    required this.imageKey,
    required this.operatingHours,
    required this.imageKey2,
  });

  factory EstateSettings.fromJson(Map<String, dynamic> json) {
    return EstateSettings(
      autoApproveUsers: json['auto_approve_users'] ?? false,
      requireDeedSignature: json['require_deed_signature'] ?? false,
      visitorApprovalRequired: json['visitor_approval_required'] ?? false,
      emergencyContacts: json['emergency_contacts'] ?? [],
      imageUrl: json['image_url'] ?? '',
      imageKey: json['image_key'] ?? '',
      operatingHours: OperatingHours.fromJson(json['operating_hours'] ?? {}),
      imageKey2: json['image_Key'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'auto_approve_users': autoApproveUsers,
      'require_deed_signature': requireDeedSignature,
      'visitor_approval_required': visitorApprovalRequired,
      'emergency_contacts': emergencyContacts,
      'image_url': imageUrl,
      'image_key': imageKey,
      'operating_hours': operatingHours.toJson(),
      'image_Key': imageKey2,
    };
  }
}

class OperatingHours {
  final String gateOpen;
  final String gateClose;

  OperatingHours({
    required this.gateOpen,
    required this.gateClose,
  });

  factory OperatingHours.fromJson(Map<String, dynamic> json) {
    return OperatingHours(
      gateOpen: json['gate_open'] ?? '',
      gateClose: json['gate_close'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gate_open': gateOpen,
      'gate_close': gateClose,
    };
  }
}

class Pivot {
  final int userId;
  final int estateId;
  final int roleId;
  final String createdAt;
  final String updatedAt;

  Pivot({
    required this.userId,
    required this.estateId,
    required this.roleId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      userId: json['user_id'] ?? 0,
      estateId: json['estate_id'] ?? 0,
      roleId: json['role_id'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'estate_id': estateId,
      'role_id': roleId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}