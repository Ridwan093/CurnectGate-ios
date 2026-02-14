import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'permit_item.freezed.dart';
part 'permit_item.g.dart';
@freezed
class PermitItem with _$PermitItem {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory PermitItem({
    int? id,
    int? clearancePermitId,
    String? itemName,
    int? quantity,
    String? description,
    dynamic estimatedValue,
    String? itemCategory,
    bool? verified,
    String? verificationNotes,
    String? createdAt,
    String? updatedAt,
  }) = _PermitItem;

  factory PermitItem.fromJson(Map<String, dynamic> json) =>
      _$PermitItemFromJson(json);

  factory PermitItem.fromSafeJson(Map<String, dynamic>? json) {
    if (json == null) return PermitItem.empty();

    return PermitItem(
      id: NullSafetyHelper.safeInt(json['id']),
      clearancePermitId:
          NullSafetyHelper.safeInt(json['clearance_permit_id']),
      itemName: NullSafetyHelper.safeString(json['item_name']),
      quantity: NullSafetyHelper.safeInt(json['quantity']),
      description: NullSafetyHelper.safeString(json['description']),
      estimatedValue: json['estimated_value'],
      itemCategory: NullSafetyHelper.safeString(json['item_category']),
      verified: NullSafetyHelper.safeBool(json['verified']),
      verificationNotes:
          NullSafetyHelper.safeString(json['verification_notes']),
      createdAt: NullSafetyHelper.safeString(json['created_at']),
      updatedAt: NullSafetyHelper.safeString(json['updated_at']),
    );
  }

  factory PermitItem.empty() => const PermitItem(
        id: null,
        clearancePermitId: null,
        itemName: null,
        quantity: null,
        description: null,
        estimatedValue: null,
        itemCategory: null,
        verified: null,
        verificationNotes: null,
        createdAt: null,
        updatedAt: null,
      );
}
