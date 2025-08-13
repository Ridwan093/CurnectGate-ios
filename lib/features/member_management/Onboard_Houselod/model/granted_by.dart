import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'granted_by.freezed.dart';
part 'granted_by.g.dart';

@freezed
class GrantedBy with _$GrantedBy {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory GrantedBy({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
  }) = _GrantedBy;

  factory GrantedBy.fromJson(Map<String, dynamic> json) => 
      _$GrantedByFromJson(json);

  factory GrantedBy.safeFromJson(Map<String, dynamic>? json) {
    return GrantedBy(
      id: NullSafetyHelper.safeInt(json?['id']),
      name: NullSafetyHelper.safeString(json?['name']),
    );
  }

  factory GrantedBy.empty() => const GrantedBy(
    id: null,
    name: null,
  );
}