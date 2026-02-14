import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'address_data.dart';

part 'estate_address_response.freezed.dart';
part 'estate_address_response.g.dart';

@freezed
class EstateAddressResponse with _$EstateAddressResponse {
  const factory EstateAddressResponse({
    bool? status,
    String? message,
    int? code,
    AddressData? data,
  }) = _EstateAddressResponse;

  factory EstateAddressResponse.safeFromJson(Map<String, dynamic>? json) {
    return EstateAddressResponse(
      status: NullSafetyHelper.safeBool(json?['status']),
      message: NullSafetyHelper.safeString(json?['message']),
      code: NullSafetyHelper.safeInt(json?['code']),
      data: AddressData.safeFromJson(json?['data']),
    );
  }

  factory EstateAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$EstateAddressResponseFromJson(json);
}
