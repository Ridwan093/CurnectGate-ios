// leadership_role_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'leadership_role_model.freezed.dart';
part 'leadership_role_model.g.dart';

@freezed
class LeadershipRole with _$LeadershipRole {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory LeadershipRole({
     String? type,
     String? title,
     String? organization,
     String? category,
     int? termNumber,
  }) = _LeadershipRole;

  factory LeadershipRole.fromJson(Map<String, dynamic> json) =>
      _$LeadershipRoleFromJson(json);

  factory LeadershipRole.fromSafeJson(Map<String, dynamic> json) {
    return LeadershipRole(
      type: NullSafetyHelper.safeString(json['type']),
      title: NullSafetyHelper.safeString(json['title']),
      organization: NullSafetyHelper.safeString(json['organization']),
      category: NullSafetyHelper.safeString(json['category']),
      termNumber: NullSafetyHelper.safeInt(json['term_number']),
    );
  }

  factory LeadershipRole.empty() => const LeadershipRole(
    type: '',
    title: '',
    organization: '',
    category: '',
    termNumber: null,
  );
}
