import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'profile_visibility.dart';

part 'privacy.freezed.dart';
part 'privacy.g.dart';

@freezed
class Privacy with _$Privacy {
  @JsonSerializable(explicitToJson: true)
  const factory Privacy({
    @JsonKey(name: 'show_email') ProfileVisibility? showEmail,
    @JsonKey(name: 'show_phone') ProfileVisibility? showPhone,
    @JsonKey(name: 'profile_visibility') ProfileVisibility? profileVisibility,
  }) = _Privacy;

  /// Auto-generated fromJson
  factory Privacy.fromJson(Map<String, dynamic> json) =>
      _$PrivacyFromJson(json);

  /// Custom safeFromJson using NullSafetyHelper
  factory Privacy.safeFromJson(Map<String, dynamic>? json) => Privacy(
    showEmail: ProfileVisibility.safeFromJson(
      NullSafetyHelper.safeMap(json?['show_email']),
    ),
    showPhone: ProfileVisibility.safeFromJson(
      NullSafetyHelper.safeMap(json?['show_phone']),
    ),
    profileVisibility: ProfileVisibility.safeFromJson(
      NullSafetyHelper.safeMap(json?['profile_visibility']),
    ),
  );
}
