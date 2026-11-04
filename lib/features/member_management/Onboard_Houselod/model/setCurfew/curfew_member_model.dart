import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'curfew_member_model.freezed.dart';
part 'curfew_member_model.g.dart';

@freezed
class CurfewMember with _$CurfewMember {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory CurfewMember({
    int? id,
    String? name,
    String? email,
  }) = _CurfewMember;

  factory CurfewMember.fromJson(Map<String, dynamic> json) =>
      _$CurfewMemberFromJson(json);

  factory CurfewMember.fromSafeJson(Map<String, dynamic> json) {
    return CurfewMember(
      id: NullSafetyHelper.safeInt(json['id']),
      name: NullSafetyHelper.safeString(json['name']),
      email: NullSafetyHelper.safeString(json['email']),
    );
  }
}
