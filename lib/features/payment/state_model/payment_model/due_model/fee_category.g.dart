// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fee_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeeCategoryImpl _$$FeeCategoryImplFromJson(Map<String, dynamic> json) =>
    _$FeeCategoryImpl(
      id: (json['id'] as num?)?.toInt(),
      estateId: (json['estate_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      defaultAmount: json['default_amount'] as String?,
      icon: json['icon'] as String?,
      frequency: json['frequency'] as String?,
      isProRated: json['is_pro_rated'] as bool?,
      isMandatory: json['is_mandatory'] as bool?,
      lateFeeApplicable: json['late_fee_applicable'] as bool?,
      gracePeriodDays: (json['grace_period_days'] as num?)?.toInt(),
      isActive: json['is_active'] as bool?,
      displayOrder: (json['display_order'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'],
    );

Map<String, dynamic> _$$FeeCategoryImplToJson(_$FeeCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'estate_id': instance.estateId,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'default_amount': instance.defaultAmount,
      'icon': instance.icon,
      'frequency': instance.frequency,
      'is_pro_rated': instance.isProRated,
      'is_mandatory': instance.isMandatory,
      'late_fee_applicable': instance.lateFeeApplicable,
      'grace_period_days': instance.gracePeriodDays,
      'is_active': instance.isActive,
      'display_order': instance.displayOrder,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
    };
