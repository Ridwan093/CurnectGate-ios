

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';


part 'facility_access.freezed.dart';
part 'facility_access.g.dart';



@freezed
class FacilityAccess with _$FacilityAccess {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory FacilityAccess({bool? enabled}) = _FacilityAccess;

  factory FacilityAccess.fromJson(Map<String, dynamic> json) =>
      _$FacilityAccessFromJson(json);

  factory FacilityAccess.fromSafeJson(Map<String, dynamic> json) {
    return FacilityAccess(enabled: NullSafetyHelper.safeBool(json['enabled']));
  }

  factory FacilityAccess.empty() => const FacilityAccess(enabled: null);
}
