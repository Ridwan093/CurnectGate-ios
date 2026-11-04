// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'committee_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommitteesDataImpl _$$CommitteesDataImplFromJson(Map<String, dynamic> json) =>
    _$CommitteesDataImpl(
      committees: json['committees'] == null
          ? null
          : CommitteeList.fromJson(json['committees'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommitteesDataImplToJson(
        _$CommitteesDataImpl instance) =>
    <String, dynamic>{
      'committees': instance.committees?.toJson(),
    };
