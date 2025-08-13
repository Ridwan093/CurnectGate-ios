// granted_by_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'granted_by_model.freezed.dart';
part 'granted_by_model.g.dart';

@freezed
class GrantedBy with _$GrantedBy {
  const factory GrantedBy({
    int? id,
    String? name,
  }) = _GrantedBy;

  factory GrantedBy.fromJson(Map<String, dynamic> json) =>
      _$GrantedByFromJson(json);

  factory GrantedBy.safeFromJson(Map<String, dynamic>? json) {
    return GrantedBy(
      id: NullSafetyHelper.safeInt(json?['id']),
      name: NullSafetyHelper.safeString(json?['name']),
    );
  }
}