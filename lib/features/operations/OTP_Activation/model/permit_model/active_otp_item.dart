import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'active_otp_item.freezed.dart';
part 'active_otp_item.g.dart';

@freezed
class ActiveOtpItem with _$ActiveOtpItem {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory ActiveOtpItem({
    int? otpId,
    String? otpCode,
    String? guestName,
    String? guestPhone,
    String? purpose,
    String? property,
    String? propertyCode,
    String? checkInTime,
    String? status,
    String? validUntil,
    bool? hasPermit,
  }) = _ActiveOtpItem;

  factory ActiveOtpItem.fromJson(Map<String, dynamic> json) =>
      _$ActiveOtpItemFromJson(json);

  factory ActiveOtpItem.fromSafeJson(Map<String, dynamic>? json) {
    if (json == null) return ActiveOtpItem.empty();

    return ActiveOtpItem(
      otpId: NullSafetyHelper.safeInt(json['otp_id']),
      otpCode: NullSafetyHelper.safeString(json['otp_code']),
      guestName: NullSafetyHelper.safeString(json['guest_name']),
      guestPhone: NullSafetyHelper.safeString(json['guest_phone']),
      purpose: NullSafetyHelper.safeString(json['purpose']),
      property: NullSafetyHelper.safeString(json['property']),
      propertyCode: NullSafetyHelper.safeString(json['property_code']),
      checkInTime: NullSafetyHelper.safeString(json['check_in_time']),
      status: NullSafetyHelper.safeString(json['status']),
      validUntil: NullSafetyHelper.safeString(json['valid_until']),
      hasPermit: NullSafetyHelper.safeBool(json['has_permit']),
    );
  }

  factory ActiveOtpItem.empty() => const ActiveOtpItem(
        otpId: null,
        otpCode: null,
        guestName: null,
        guestPhone: null,
        purpose: null,
        property: null,
        propertyCode: null,
        checkInTime: null,
        status: null,
        validUntil: null,
        hasPermit: null,
      );
}
