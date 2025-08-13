import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'estate_settings.dart';
import 'pivot.dart';

part 'estate.freezed.dart';
part 'estate.g.dart';

@freezed
class Estate with _$Estate {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory Estate({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'onboarded_by') int? onboardedBy,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'estate_code') String? estateCode,
    @JsonKey(name: 'state_id') int? stateId,
    @JsonKey(name: 'city') String? city,
    @JsonKey(name: 'postal_code') String? postalCode,
    @JsonKey(name: 'contact_email') String? contactEmail,
    @JsonKey(name: 'contact_phone') String? contactPhone,
    @JsonKey(name: 'settings') EstateSettings? settings,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'media_url') dynamic mediaUrl,
    @JsonKey(name: 'media_key') dynamic mediaKey,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'pivot') Pivot? pivot,
  }) = _Estate;

  factory Estate.fromJson(Map<String, dynamic> json) =>
      _$EstateFromJson(json);

  factory Estate.safeFromJson(Map<String, dynamic>? json) {
    return Estate(
      id: NullSafetyHelper.safeInt(json?['id']),
      name: NullSafetyHelper.safeString(json?['name']),
      onboardedBy: NullSafetyHelper.safeInt(json?['onboarded_by']),
      address: NullSafetyHelper.safeString(json?['address']),
      estateCode: NullSafetyHelper.safeString(json?['estate_code']),
      stateId: NullSafetyHelper.safeInt(json?['state_id']),
      city: NullSafetyHelper.safeString(json?['city']),
      postalCode: NullSafetyHelper.safeString(json?['postal_code']),
      contactEmail: NullSafetyHelper.safeString(json?['contact_email']),
      contactPhone: NullSafetyHelper.safeString(json?['contact_phone']),
      settings: EstateSettings.safeFromJson(json?['settings']),
      status: NullSafetyHelper.safeString(json?['status'], ),
      mediaUrl: json?['media_url'],
      mediaKey: json?['media_key'],
      createdAt: NullSafetyHelper.safeString(json?['created_at']),
      updatedAt: NullSafetyHelper.safeString(json?['updated_at']),
      pivot: Pivot.safeFromJson(json?['pivot']),
    );
  }

  factory Estate.defaults() => Estate(
        id: null,
        name: null,
        onboardedBy: null,
        address: null,
        estateCode: null,
        stateId: null,
        city: null,
        postalCode: null,
        contactEmail: null,
        contactPhone: null,
        settings: EstateSettings.defaults(),
        status: 'inactive',
        mediaUrl: null,
        mediaKey: null,
        createdAt: null,
        updatedAt: null,
        pivot: Pivot.empty(),
      );
}