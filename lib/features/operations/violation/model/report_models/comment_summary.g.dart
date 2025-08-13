// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentSummaryImpl _$$CommentSummaryImplFromJson(Map<String, dynamic> json) =>
    _$CommentSummaryImpl(
      totalComments: (json['totalComments'] as num?)?.toInt() ?? 0,
      publicComments: (json['publicComments'] as num?)?.toInt() ?? 0,
      internalComments: (json['internalComments'] as num?)?.toInt() ?? 0,
      latestComment: json['latestComment'] == null
          ? null
          : LatestComment.fromJson(
              json['latestComment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommentSummaryImplToJson(
        _$CommentSummaryImpl instance) =>
    <String, dynamic>{
      'totalComments': instance.totalComments,
      'publicComments': instance.publicComments,
      'internalComments': instance.internalComments,
      'latestComment': instance.latestComment?.toJson(),
    };
