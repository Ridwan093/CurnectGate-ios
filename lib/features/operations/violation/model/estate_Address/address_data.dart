import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'estate_address.dart';


part 'address_data.freezed.dart';
part 'address_data.g.dart';

@freezed
class AddressData with _$AddressData {
  const factory AddressData({
    List<EstateAddress>? addresses,
    int? total,
  }) = _AddressData;

  factory AddressData.safeFromJson(Map<String, dynamic>? json) {
    return AddressData(
      addresses: NullSafetyHelper.safeList(json?['addresses'])
    .map((e) => EstateAddress.fromJson(e))
    .toList(),
      total: NullSafetyHelper.safeInt(json?['total']),
    );
  }


  factory AddressData.fromJson(Map<String, dynamic> json) =>
      _$AddressDataFromJson(json);
}
