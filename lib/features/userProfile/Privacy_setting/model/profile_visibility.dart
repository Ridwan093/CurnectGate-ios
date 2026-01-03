import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'profile_visibility.freezed.dart';
part 'profile_visibility.g.dart';

@freezed
class ProfileVisibility with _$ProfileVisibility {
   @JsonSerializable(explicitToJson: true)
  const factory ProfileVisibility({
    String? name,
    String? description,
    String? type,
    String? key,
    bool? value,
  }) = _ProfileVisibility;

  factory ProfileVisibility.fromJson(Map<String, dynamic> json) =>
      _$ProfileVisibilityFromJson(json);

  factory ProfileVisibility.safeFromJson(Map<String, dynamic>? json) =>
      ProfileVisibility(
        name: NullSafetyHelper.safeString(json?['name']),
        description: NullSafetyHelper.safeString(json?['description']),
        type: NullSafetyHelper.safeString(json?['type']),
        key: NullSafetyHelper.safeString(json?['key']),
        value: NullSafetyHelper.safeBool(json?['value']),
      );
}
