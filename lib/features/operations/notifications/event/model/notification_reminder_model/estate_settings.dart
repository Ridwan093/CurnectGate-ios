import 'package:freezed_annotation/freezed_annotation.dart';

import 'operating_hours.dart';

part 'estate_settings.freezed.dart';
part 'estate_settings.g.dart';

@freezed
class EstateSettings with _$EstateSettings {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory EstateSettings({
    @JsonKey(name: 'auto_approve_users') required bool? autoApproveUsers,
    @JsonKey(name: 'require_deed_signature')
    required bool? requireDeedSignature,
    @JsonKey(name: 'visitor_approval_required')
    required bool? visitorApprovalRequired,
    @JsonKey(name: 'emergency_contacts')
    Map<String, List<dynamic>>? emergencyContacts,
    @JsonKey(name: 'image_url') required String? imageUrl,
    @JsonKey(name: 'image_key') required String? imageKey,
    @JsonKey(name: 'operating_hours') required OperatingHours? operatingHours,
    @JsonKey(name: 'image_Key') required String? imageKeyAlt,
  }) = _EstateSettings;

  factory EstateSettings.fromJson(Map<String, dynamic> json) =>
      _$EstateSettingsFromJson(json);

  factory EstateSettings.safeFromJson(Map<String, dynamic>? json) {
    final contacts = json?['emergency_contacts'];
    if (json == null) {
      return EstateSettings(
        autoApproveUsers: null,
        requireDeedSignature: null,
        visitorApprovalRequired: null,
        emergencyContacts: null,
        imageUrl: null,
        imageKey: null,
        operatingHours: null,
        imageKeyAlt: null,
      );
    }

    return EstateSettings(
      autoApproveUsers: json['auto_approve_users'] as bool?,
      requireDeedSignature: json['require_deed_signature'] as bool?,
      visitorApprovalRequired: json['visitor_approval_required'] as bool?,
      emergencyContacts:
          contacts is Map<String, dynamic>
              ? contacts.map(
                (key, value) =>
                    MapEntry(key, value is List ? value : <dynamic>[]),
              )
              : {},
      imageUrl: json['image_url'] as String?,
      imageKey: json['image_key'] as String?,
      operatingHours: OperatingHours.safeFromJson(json['operating_hours']),
      imageKeyAlt: json['image_Key'] as String?,
    );
  }
}
