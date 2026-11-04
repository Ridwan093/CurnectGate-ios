import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'changed_by.freezed.dart';
part 'changed_by.g.dart';

@freezed
class ChangedBy with _$ChangedBy {
  const factory ChangedBy({
    int? id,
    String? name,
    String? role,
  }) = _ChangedBy;

  factory ChangedBy.safeFromJson(Map<String, dynamic>? json) {
    return ChangedBy(
      id: NullSafetyHelper.safeInt(json?['id']),
      name: NullSafetyHelper.safeString(json?['name']),
      role: NullSafetyHelper.safeString(json?['role']),
    );
  }

  factory ChangedBy.fromJson(Map<String, dynamic> json) =>
      _$ChangedByFromJson(json);
}
