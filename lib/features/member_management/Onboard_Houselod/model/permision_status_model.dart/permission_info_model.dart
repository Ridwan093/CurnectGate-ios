// permission_info_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission_info_model.freezed.dart';
part 'permission_info_model.g.dart';

@freezed
class PermissionInfo with _$PermissionInfo {
  const factory PermissionInfo({
    int? id,
    String? name,
    String? slug,
    String? description,
    String? category,
  }) = _PermissionInfo;

  factory PermissionInfo.fromJson(Map<String, dynamic> json) =>
      _$PermissionInfoFromJson(json);

  factory PermissionInfo.safeFromJson(Map<String, dynamic>? json) {
    return PermissionInfo(
      id: NullSafetyHelper.safeInt(json?['id']),
      name: NullSafetyHelper.safeString(json?['name']),
      slug: NullSafetyHelper.safeString(json?['slug']),
      description: NullSafetyHelper.safeString(json?['description']),
      category: NullSafetyHelper.safeString(json?['category']),
    );
  }
}