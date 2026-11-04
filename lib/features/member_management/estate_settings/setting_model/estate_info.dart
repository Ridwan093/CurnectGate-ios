import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'estate_info.freezed.dart';
part 'estate_info.g.dart';

@freezed
class EstateInfo with _$EstateInfo {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory EstateInfo({int? id, String? name}) = _EstateInfo;

  factory EstateInfo.fromJson(Map<String, dynamic> json) =>
      _$EstateInfoFromJson(json);

  factory EstateInfo.safeFromJson(Map<String, dynamic>? json) {
    return EstateInfo(
      id: NullSafetyHelper.safeInt(json?['id']),
      name: NullSafetyHelper.safeString(json?['name']),
    );
  }

  factory EstateInfo.empty() => const EstateInfo(id: 0, name: '');
}
