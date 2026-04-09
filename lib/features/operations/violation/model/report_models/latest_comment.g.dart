// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LatestCommentImpl _$$LatestCommentImplFromJson(Map<String, dynamic> json) =>
    _$LatestCommentImpl(
      comment: json['comment'] as String? ?? '',
      user: json['user'] as String? ?? '',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$LatestCommentImplToJson(_$LatestCommentImpl instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'user': instance.user,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
