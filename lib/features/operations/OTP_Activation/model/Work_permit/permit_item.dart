import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'permit_item.freezed.dart';
part 'permit_item.g.dart';

@freezed
class PermitItem with _$PermitItem {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory PermitItem({
    int? id,
    String? name,
    String? description,
    dynamic estimatedValue,
  }) = _PermitItem;

  factory PermitItem.fromJson(Map<String, dynamic> json) =>
      _$PermitItemFromJson(json);

  factory PermitItem.fromSafeJson(Map<String, dynamic>? json) {
    if (json == null) return PermitItem.empty();
    return PermitItem(
      id: NullSafetyHelper.safeInt(json['id']),
      name: NullSafetyHelper.safeString(json['name']),
      description: NullSafetyHelper.safeString(json['description']),
      estimatedValue: json['estimated_value'],
    );
  }

  factory PermitItem.empty() => const PermitItem(
        id: null,
        name: null,
        description: null,
        estimatedValue: null,
      );
}
