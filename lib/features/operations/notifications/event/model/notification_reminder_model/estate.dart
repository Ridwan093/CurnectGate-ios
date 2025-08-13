import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'estate_settings.dart';

part 'estate.freezed.dart';
part 'estate.g.dart';

@freezed
class Estate with _$Estate {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory Estate({
    @JsonKey(name: 'id') required int? id,
    @JsonKey(name: 'name') required String? name,
    @JsonKey(name: 'onboarded_by') required int? onboardedBy,
    @JsonKey(name: 'address') required String? address,
    @JsonKey(name: 'estate_code') required String? estateCode,
    @JsonKey(name: 'state_id') required int? stateId,
    @JsonKey(name: 'city') required String? city,
    @JsonKey(name: 'postal_code') required String? postalCode,
    @JsonKey(name: 'contact_email') required String? contactEmail,
    @JsonKey(name: 'contact_phone') required String? contactPhone,
    @JsonKey(name: 'settings') required EstateSettings? settings,
    @JsonKey(name: 'status') required String? status,
    @JsonKey(name: 'media_url') required String? mediaUrl,
    @JsonKey(name: 'media_key') required String? mediaKey,
    @JsonKey(name: 'created_at') required String? createdAt,
    @JsonKey(name: 'updated_at') required String? updatedAt,
  }) = _Estate;

  factory Estate.fromJson(Map<String, dynamic> json) =>
      _$EstateFromJson(json);

  factory Estate.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Estate(
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
        settings: null,
        status: null,
        mediaUrl: null,
        mediaKey: null,
        createdAt: null,
        updatedAt: null,
      );
    }
    return Estate(
      id: NullSafetyHelper.safeInt(json['id']),
      name: json['name'] as String?,
      onboardedBy: NullSafetyHelper.safeInt(json['onboarded_by']),
      address: json['address'] as String?,
      estateCode: json['estate_code'] as String?,
      stateId: NullSafetyHelper.safeInt(json['state_id']),
      city: json['city'] as String?,
      postalCode: json['postal_code'] as String?,
      contactEmail: json['contact_email'] as String?,
      contactPhone: json['contact_phone'] as String?,
      settings: EstateSettings.safeFromJson(json['settings']),
      status: json['status'] as String?,
      mediaUrl: json['media_url'] as String?,
      mediaKey: json['media_key'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}