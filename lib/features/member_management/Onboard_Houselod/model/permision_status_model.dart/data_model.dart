
import 'package:freezed_annotation/freezed_annotation.dart';

import 'member_model.dart';
import 'member_permission_model.dart';
import 'summary_model.dart';

part 'data_model.freezed.dart';
part 'data_model.g.dart';


@freezed
class PermissionsData with _$PermissionsData {
  const factory PermissionsData({
    Member? member,
    Map<String, MemberPermission>? permissions,
    Summary? summary,
  }) = _PermissionsData;

  factory PermissionsData.fromJson(Map<String, dynamic> json) =>
      _$PermissionsDataFromJson(json);

  factory PermissionsData.safeFromJson(Map<String, dynamic>? json) {
    return PermissionsData(
      member: Member.safeFromJson(json?['member']),
      permissions: (json?['permissions'] as Map<String, dynamic>?)?.map(
        (key, value) => MapEntry(
          key, 
          MemberPermission.safeFromJson(value)
        ),
      ),
      summary: Summary.safeFromJson(json?['summary']),
    );
  }
}