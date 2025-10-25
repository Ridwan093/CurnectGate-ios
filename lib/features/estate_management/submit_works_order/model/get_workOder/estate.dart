import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'estate.freezed.dart';
part 'estate.g.dart';

@freezed
class Estate with _$Estate {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory Estate({
    int? id,
    String? name,
    String? code,
    String? description,
    String? createdAt,
    String? updatedAt,
  }) = _Estate;

  factory Estate.fromJson(Map<String, dynamic> json) => _$EstateFromJson(json);

  factory Estate.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return Estate.empty();
    return Estate(
      id: NullSafetyHelper.safeInt(json['id']),
      name: NullSafetyHelper.safeString(json['name']),
      code: NullSafetyHelper.safeString(json['code']),
      description: NullSafetyHelper.safeString(json['description']),
      createdAt: NullSafetyHelper.safeString(json['created_at']),
      updatedAt: NullSafetyHelper.safeString(json['updated_at']),
    );
  }

  factory Estate.empty() => const Estate(
    id: null,
    name: null,
    code: null,
    description: null,
    createdAt: null,
    updatedAt: null,
  );
}
