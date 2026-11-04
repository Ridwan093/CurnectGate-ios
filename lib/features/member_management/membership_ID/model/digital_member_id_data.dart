import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

import 'digital_id.dart';
import 'estate.dart';
import 'user.dart';

part 'digital_member_id_data.freezed.dart';
part 'digital_member_id_data.g.dart';

@freezed
class DigitalMemberIdData with _$DigitalMemberIdData {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory DigitalMemberIdData({
    @JsonKey(name: 'digital_id') DigitalId? digitalId,
    @JsonKey(name: 'user') User? user,
    @JsonKey(name: 'estate') Estate? estate,
    @JsonKey(name: 'qr_code_url') String? qrCodeUrl,
    @JsonKey(name: 'formatted_id') String? formattedId,
    @JsonKey(name: 'generated_at') String? generatedAt,
    @JsonKey(name: 'status') String? status,
  }) = _DigitalMemberIdData;

  // Standard Freezed-generated parser
  factory DigitalMemberIdData.fromJson(Map<String, dynamic> json) =>
      _$DigitalMemberIdDataFromJson(json);

  // Custom null-safe parser with comprehensive error handling
  factory DigitalMemberIdData.safeFromJson(Map<String, dynamic>? json) {
    return DigitalMemberIdData(
      digitalId: DigitalId.safeFromJson(json?['digital_id'] as Map<String, dynamic>?),
      user: User.safeFromJson(json?['user'] as Map<String, dynamic>?),
      estate: Estate.safeFromJson(json?['estate']),
      qrCodeUrl: NullSafetyHelper.safeString(json?['qr_code_url']),
      formattedId: NullSafetyHelper.safeString(json?['formatted_id']),
      generatedAt: NullSafetyHelper.safeString(json?['generated_at']),
      status: NullSafetyHelper.safeString(json?['status'], ),
    );
  }

  // Default instance with safe default values
  factory DigitalMemberIdData.defaults() => DigitalMemberIdData(
        digitalId: DigitalId.safeFromJson(null),
        user: User.safeFromJson(null),
        estate: Estate.safeFromJson(null),
        qrCodeUrl: '',
        formattedId: '',
        generatedAt: '',
        status: 'inactive',
      );
}