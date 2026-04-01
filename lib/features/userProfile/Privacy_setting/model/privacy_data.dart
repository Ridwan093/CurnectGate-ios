import 'package:freezed_annotation/freezed_annotation.dart';

import 'privacy.dart';

part 'privacy_data.freezed.dart';
part 'privacy_data.g.dart';

@freezed
class Data with _$Data {
   @JsonSerializable(explicitToJson: true)
  const factory Data({
    Privacy? privacy,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  factory Data.safeFromJson(Map<String, dynamic>? json) => Data(
        privacy: Privacy.safeFromJson(json?['privacy']),
      );
}
