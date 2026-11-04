// member_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_model.freezed.dart';
part 'member_model.g.dart';

@freezed
class Member with _$Member {
  const factory Member({
    int? id,
    String? name,
    String? email,
    String? role,
    @JsonKey(name: 'estate_id') int? estateId,
  }) = _Member;

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  factory Member.safeFromJson(Map<String, dynamic>? json) {
    return Member(
      id: NullSafetyHelper.safeInt(json?['id']),
      name: NullSafetyHelper.safeString(json?['name']),
      email: NullSafetyHelper.safeString(json?['email']),
      role: NullSafetyHelper.safeString(json?['role']),
      estateId: NullSafetyHelper.safeInt(json?['estate_id']),
    );
  }
}