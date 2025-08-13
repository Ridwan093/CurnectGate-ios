import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'evidence.freezed.dart';
part 'evidence.g.dart';

@freezed
class Evidence with _$Evidence {
  @JsonSerializable(explicitToJson: true)
  const factory Evidence({
    @JsonKey(name: 'media_urls') @Default([]) List<String> mediaUrls,
    @JsonKey(name: 'media_count') @Default(0) int mediaCount,
    @JsonKey(name: 'has_evidence') @Default(false) bool hasEvidence,
  }) = _Evidence;

  factory Evidence.fromJson(Map<String, dynamic> json) =>
      _$EvidenceFromJson(json);

  factory Evidence.safeFromJson(Map<String, dynamic>? json) => Evidence(
        mediaUrls: NullSafetyHelper.safeStringList(json?['media_urls']),
        mediaCount: NullSafetyHelper.safeInt(json?['media_count']),
        hasEvidence: NullSafetyHelper.safeBool(json?['has_evidence']),
      );
}
