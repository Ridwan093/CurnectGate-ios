import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'preference_item_option.freezed.dart';
part 'preference_item_option.g.dart';

@freezed
class PreferenceItemOption with _$PreferenceItemOption {
  @JsonSerializable(explicitToJson: true)
  const factory PreferenceItemOption({
    String? key,
    String? name,
  }) = _PreferenceItemOption;

  factory PreferenceItemOption.fromJson(Map<String, dynamic> json) =>
      _$PreferenceItemOptionFromJson(json);

  factory PreferenceItemOption.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return const PreferenceItemOption(key: '', name: '');

    return PreferenceItemOption(
      key: NullSafetyHelper.safeString(json['key']),
      name: NullSafetyHelper.safeString(json['name']),
    );
  }

  factory PreferenceItemOption.empty() =>
      const PreferenceItemOption(key: '', name: '');
}
