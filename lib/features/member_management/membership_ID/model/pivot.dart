import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pivot.freezed.dart';
part 'pivot.g.dart';

@freezed
class Pivot with _$Pivot {
  @JsonSerializable()
  const factory Pivot({
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'estate_id') int? estateId,
    @JsonKey(name: 'role_id') int? roleId,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _Pivot;

  factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);

  factory Pivot.safeFromJson(Map<String, dynamic>? json) {
    json = NullSafetyHelper.safeMap(json);
    return Pivot(
      userId: NullSafetyHelper.safeInt(json['user_id']),
      estateId: NullSafetyHelper.safeInt(json['estate_id']),
      roleId: NullSafetyHelper.safeInt(json['role_id']),
      createdAt: NullSafetyHelper.safeString(json['created_at']),
      updatedAt: NullSafetyHelper.safeString(json['updated_at']),
    );
  }
  factory Pivot.empty() => const Pivot(
  userId: 0,
  estateId: 0,
  roleId: 0,
  createdAt: '',
  updatedAt: '',
);
}