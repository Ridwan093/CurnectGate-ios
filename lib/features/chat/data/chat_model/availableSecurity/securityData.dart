


import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/chat/data/chat_model/availableSecurity/security.dart';

part 'securityData.freezed.dart';
part 'securityData.g.dart';





@freezed
class SecurityPersonnelData with _$SecurityPersonnelData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory SecurityPersonnelData({
    List<SecurityPersonnel>? securityPersonnel,
    int? count,
  }) = _SecurityPersonnelData;

  factory SecurityPersonnelData.fromJson(Map<String, dynamic> json) =>
      _$SecurityPersonnelDataFromJson(json);

  factory SecurityPersonnelData.fromSafeJson(
      Map<String, dynamic> json) {
    return SecurityPersonnelData(
      securityPersonnel: (json["security_personnel"] as List?)
              ?.map((e) => SecurityPersonnel.fromSafeJson(e))
              .toList() ??
          [],
      count: NullSafetyHelper.safeInt(json["count"]),
    );
  }
}