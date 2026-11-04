// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhotoImpl _$$PhotoImplFromJson(Map<String, dynamic> json) => _$PhotoImpl(
      url: json['url'] as String?,
      filename: json['filename'] as String?,
      publicId: json['public_id'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String?,
    );

Map<String, dynamic> _$$PhotoImplToJson(_$PhotoImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'filename': instance.filename,
      'public_id': instance.publicId,
      'thumbnail_url': instance.thumbnailUrl,
    };
