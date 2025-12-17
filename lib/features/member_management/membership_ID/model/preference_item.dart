import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'preference_item_option.dart';

part 'preference_item.freezed.dart';
part 'preference_item.g.dart';

@freezed
class PreferenceItem with _$PreferenceItem {
  @JsonSerializable(explicitToJson: true)
  const factory PreferenceItem({
    String? key,
    String? name,
    String? type,
    dynamic value,
    @JsonKey(defaultValue: [])
    List<PreferenceItemOption>? options,
    String? description,
  }) = _PreferenceItem;

  factory PreferenceItem.fromJson(Map<String, dynamic> json) =>
      _$PreferenceItemFromJson(json);

  factory PreferenceItem.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return PreferenceItem.empty();

    return PreferenceItem(
      key: NullSafetyHelper.safeString(json['key']),
      name: NullSafetyHelper.safeString(json['name']),
      type: NullSafetyHelper.safeString(json['type']),
      value: json['value'], // can be bool, string, int, etc.
      options: (json['options'] is List)
          ? (json['options'] as List)
              .map((e) => PreferenceItemOption.safeFromJson(e))
              .toList()
          : <PreferenceItemOption>[],
      description: NullSafetyHelper.safeString(json['description']),
    );
  }

  factory PreferenceItem.empty() => const PreferenceItem(
        key: '',
        name: '',
        type: '',
        value: null,
        options: [],
        description: '',
      );
}
