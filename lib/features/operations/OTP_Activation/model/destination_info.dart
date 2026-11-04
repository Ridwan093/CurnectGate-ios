import 'package:freezed_annotation/freezed_annotation.dart';
import 'nullSafty_model.dart';

part 'destination_info.freezed.dart';
part 'destination_info.g.dart';

@freezed
class DestinationInfo with _$DestinationInfo {
  const factory DestinationInfo({
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'type') @Default('') String type,
    @JsonKey(name: 'phone') @Default('') String phone,
    @JsonKey(name: 'email') @Default('') String email,
    @JsonKey(name: 'address') @Default('') String address,
  }) = _DestinationInfo;

  factory DestinationInfo.fromJson(Map<String, dynamic> json) =>
      _$DestinationInfoFromJson(json);

  static DestinationInfo fromSafeJson(Map<String, dynamic>? json) {
    return DestinationInfo(
      id: NullSafetyHelper.safeInt(json?['id']),
      name: NullSafetyHelper.safeString(json?['name']),
      type: NullSafetyHelper.safeString(json?['type']),
      phone: NullSafetyHelper.safeString(json?['phone']),
      email: NullSafetyHelper.safeString(json?['email']),
      address: NullSafetyHelper.safeString(json?['address']),
    );
  }
}
