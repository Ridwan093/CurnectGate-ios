// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      id: (json['id'] as num?)?.toInt(),
      violationId: (json['violation_id'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : CommentUser.fromJson(json['user'] as Map<String, dynamic>),
      comment: json['comment'] as String?,
      isInternal: json['is_internal'] as bool?,
      hasMedia: json['has_media'] as bool?,
      mediaUrl: json['media_url'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      canEdit: json['can_edit'] as bool?,
      canDelete: json['can_delete'] as bool?,
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'violation_id': instance.violationId,
      'user': instance.user?.toJson(),
      'comment': instance.comment,
      'is_internal': instance.isInternal,
      'has_media': instance.hasMedia,
      'media_url': instance.mediaUrl,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'can_edit': instance.canEdit,
      'can_delete': instance.canDelete,
    };
