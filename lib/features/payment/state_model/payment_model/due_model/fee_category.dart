import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'fee_category.freezed.dart';
part 'fee_category.g.dart';

@freezed
class FeeCategory with _$FeeCategory {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory FeeCategory({
    int? id,
    int? estateId,
    String? name,
    String? slug,
    String? description,
    String? defaultAmount,
    String? icon,
    String? frequency,
    bool? isProRated,
    bool? isMandatory,
    bool? lateFeeApplicable,
    int? gracePeriodDays,
    bool? isActive,
    int? displayOrder,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,
  }) = _FeeCategory;

  factory FeeCategory.fromJson(Map<String, dynamic> json) =>
      _$FeeCategoryFromJson(json);

  factory FeeCategory.safeFromJson(Map<String, dynamic>? json) {
    return FeeCategory(
      id: NullSafetyHelper.safeInt(json?['id']),
      estateId: NullSafetyHelper.safeInt(json?['estate_id']),
      name: NullSafetyHelper.safeString(json?['name']),
      slug: NullSafetyHelper.safeString(json?['slug']),
      description: NullSafetyHelper.safeString(json?['description']),
      defaultAmount: NullSafetyHelper.safeString(json?['default_amount']),
      icon: NullSafetyHelper.safeString(json?['icon']),
      frequency: NullSafetyHelper.safeString(json?['frequency']),
      isProRated: NullSafetyHelper.safeBool(json?['is_pro_rated']),
      isMandatory: NullSafetyHelper.safeBool(json?['is_mandatory']),
      lateFeeApplicable: NullSafetyHelper.safeBool(json?['late_fee_applicable']),
      gracePeriodDays: NullSafetyHelper.safeInt(json?['grace_period_days']),
      isActive: NullSafetyHelper.safeBool(json?['is_active']),
      displayOrder: NullSafetyHelper.safeInt(json?['display_order']),
      createdAt: NullSafetyHelper.safeString(json?['created_at']),
      updatedAt: NullSafetyHelper.safeString(json?['updated_at']),
      deletedAt: json?['deleted_at'],
    );
  }

  factory FeeCategory.empty() => const FeeCategory(
        id: 0,
        estateId: 0,
        name: '',
        slug: '',
        description: '',
        defaultAmount: '0.00',
        icon: '',
        frequency: '',
        isProRated: false,
        isMandatory: false,
        lateFeeApplicable: false,
        gracePeriodDays: 0,
        isActive: false,
        displayOrder: 0,
        createdAt: '',
        updatedAt: '',
        deletedAt: null,
      );
}
