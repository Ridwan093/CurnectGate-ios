import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'estate.freezed.dart';
part 'estate.g.dart';

@freezed
class Estate with _$Estate {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory Estate({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'estate_code') required String estateCode,
  }) = _Estate;

  factory Estate.fromJson(Map<String, dynamic> json) =>
      _$EstateFromJson(json);

  factory Estate.safeFromJson(Map<String, dynamic>? json) =>
      Estate(
        id: NullSafetyHelper.safeInt(json?['id']),
        name: NullSafetyHelper.safeString(json?['name']),
        estateCode: NullSafetyHelper.safeString(json?['estate_code']),
      );
}