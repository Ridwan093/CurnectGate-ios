import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'privacy_settings.freezed.dart';
part 'privacy_settings.g.dart';

@freezed
class PrivacySettings with _$PrivacySettings {
  @JsonSerializable(
    explicitToJson: true,
    nullable: true,  // Changed to true to allow null values
    createToJson: true,
  )
  const factory PrivacySettings({
    @JsonKey(name: 'show_email', defaultValue: false) bool? showEmail,
    @JsonKey(name: 'show_phone', defaultValue: false) bool? showPhone,
    @JsonKey(name: 'profile_visibility', defaultValue: false) bool? profileVisibility,
  }) = _PrivacySettings;

  factory PrivacySettings.fromJson(Map<String, dynamic> json) =>
      _$PrivacySettingsFromJson(json);

  factory PrivacySettings.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return PrivacySettings.empty();
    
    return PrivacySettings(
      showEmail: NullSafetyHelper.safeBool(json['show_email']),
      showPhone: NullSafetyHelper.safeBool(json['show_phone']),
      profileVisibility: NullSafetyHelper.safeBool(json['profile_visibility']),
    );
  }

  factory PrivacySettings.empty() => const PrivacySettings(
    showEmail: false,
    showPhone: false,
    profileVisibility: false,
  );
}