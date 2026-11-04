// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directory_filters_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DirectoryFiltersImpl _$$DirectoryFiltersImplFromJson(
        Map<String, dynamic> json) =>
    _$DirectoryFiltersImpl(
      search: json['search'] as String?,
      committeeMember: json['committee_member'] as bool?,
      boardMember: json['board_member'] as bool?,
    );

Map<String, dynamic> _$$DirectoryFiltersImplToJson(
        _$DirectoryFiltersImpl instance) =>
    <String, dynamic>{
      'search': instance.search,
      'committee_member': instance.committeeMember,
      'board_member': instance.boardMember,
    };
