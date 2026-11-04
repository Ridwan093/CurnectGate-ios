import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'option.freezed.dart';
part 'option.g.dart';

@freezed
class Option with _$Option {
    @JsonSerializable(explicitToJson: true)
  const factory Option({
    String? key,
    String? name,
  }) = _Option;

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);

  factory Option.safeFromJson(Map<String, dynamic>? json) => Option(
        key: NullSafetyHelper.safeString(json?['key']),
        name: NullSafetyHelper.safeString(json?['name']),
      );
}
