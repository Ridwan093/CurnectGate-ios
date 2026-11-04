import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'community.freezed.dart';
part 'community.g.dart';

@freezed
class Community with _$Community {
   @JsonSerializable(explicitToJson: true)
  const factory Community({
    required String? name,
    required String? description,
    required String? type,
    required String? key,
    required bool? value,
  }) = _Community;

  factory Community.fromJson(Map<String, dynamic> json) =>
      _$CommunityFromJson(json);

  factory Community.safeFromJson(Map<String, dynamic>? json) => Community(
        name: NullSafetyHelper.safeString(json?['name']),
        description: NullSafetyHelper.safeString(json?['description']),
        type: NullSafetyHelper.safeString(json?['type']),
        key: NullSafetyHelper.safeString(json?['key']),
        value: NullSafetyHelper.safeBool(json?['value']),
      );
}
