import 'package:freezed_annotation/freezed_annotation.dart';

part 'option_model.freezed.dart';
part 'option_model.g.dart';

@freezed
class Option with _$Option {
  const factory Option({
    @Default('') String key,
    @Default('') String name,
  }) = _Option;

  factory Option.fromJson(Map<String, dynamic> json) =>
      _$OptionFromJson(json);


}
