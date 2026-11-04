// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_details_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PollDetailsDataImpl _$$PollDetailsDataImplFromJson(
        Map<String, dynamic> json) =>
    _$PollDetailsDataImpl(
      poll: json['poll'] == null
          ? null
          : PollItem.fromJson(json['poll'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PollDetailsDataImplToJson(
        _$PollDetailsDataImpl instance) =>
    <String, dynamic>{
      'poll': instance.poll?.toJson(),
    };
