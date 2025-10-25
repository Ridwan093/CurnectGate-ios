import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';
part 'photo.g.dart';

@freezed
class Photo with _$Photo {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory Photo({
    String? url,
    String? filename,
    String? publicId,
    String? thumbnailUrl,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) =>
      _$PhotoFromJson(json);

  factory Photo.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return Photo.empty();
    return Photo(
      url: NullSafetyHelper.safeString(json['url']),
      filename: NullSafetyHelper.safeString(json['filename']),
      publicId: NullSafetyHelper.safeString(json['public_id']),
      thumbnailUrl: NullSafetyHelper.safeString(json['thumbnail_url']),
    );
  }

  factory Photo.empty() => const Photo(
        url: null,
        filename: null,
        publicId: null,
        thumbnailUrl: null,
      );
}