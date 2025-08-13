import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'permission.freezed.dart';
part 'permission.g.dart';

@freezed
class Permission with _$Permission {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory Permission({
    @JsonKey(name: 'slug') String? slug,
    @JsonKey(name: 'display_name') String? displayName,
    @JsonKey(name: 'description') String? description,
  }) = _Permission;

  factory Permission.fromJson(Map<String, dynamic> json) =>
      _$PermissionFromJson(json);

  factory Permission.safeFromJson(Map<String, dynamic>? json) {
    return Permission(
      slug: NullSafetyHelper.safeString(json?['slug']),
      displayName: json?['display_name'] as String?,
      description: NullSafetyHelper.safeString(json?['description']),
    );
  }

  factory Permission.empty() => const Permission(
    slug: "",
    displayName: null,
    description: "",
  );
}