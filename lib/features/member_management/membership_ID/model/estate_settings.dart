import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'operating_hours.dart';

part 'estate_settings.freezed.dart';
part 'estate_settings.g.dart';

@freezed
class EstateSettings with _$EstateSettings {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory EstateSettings({
    @JsonKey(name: 'auto_approve_users') bool? autoApproveUsers,
    @JsonKey(name: 'require_deed_signature') bool? requireDeedSignature,
    @JsonKey(name: 'visitor_approval_required') bool? visitorApprovalRequired,
    @JsonKey(name: 'emergency_contacts') List<dynamic>? emergencyContacts,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'image_key') String? imageKey,
    @JsonKey(name: 'operating_hours') OperatingHours? operatingHours,
    @JsonKey(name: 'image_Key') String? imageKeyAlt,
  }) = _EstateSettings;

  factory EstateSettings.fromJson(Map<String, dynamic> json) =>
      _$EstateSettingsFromJson(json);

  factory EstateSettings.safeFromJson(Map<String, dynamic>? json) {
    return EstateSettings(
      autoApproveUsers: NullSafetyHelper.safeBool(json?['auto_approve_users'], ),
      requireDeedSignature: NullSafetyHelper.safeBool(json?['require_deed_signature'], ),
      visitorApprovalRequired: NullSafetyHelper.safeBool(json?['visitor_approval_required'],),
      emergencyContacts: json?['emergency_contacts'] as List<dynamic>? ?? [],
      imageUrl: NullSafetyHelper.safeString(json?['image_url']),
      imageKey: NullSafetyHelper.safeString(json?['image_key']),
      operatingHours: OperatingHours.safeFromJson(json?['operating_hours']),
      imageKeyAlt: NullSafetyHelper.safeString(json?['image_Key']),
    );
  }

  factory EstateSettings.defaults() =>  EstateSettings(
        autoApproveUsers: false,
        requireDeedSignature: false,
        visitorApprovalRequired: false,
        emergencyContacts: [],
        imageUrl: '',
        imageKey: '',
        operatingHours: OperatingHours.empty(),
        imageKeyAlt: null,
      );
}