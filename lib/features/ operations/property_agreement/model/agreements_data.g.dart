// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agreements_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgreementsDataImpl _$$AgreementsDataImplFromJson(Map<String, dynamic> json) =>
    _$AgreementsDataImpl(
      agreements: json['agreements'] == null
          ? null
          : AgreementsContainer.fromJson(
              json['agreements'] as Map<String, dynamic>),
      needsAction: json['needsAction'] as bool?,
      requiredActions: (json['requiredActions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      userInfo: json['userInfo'] == null
          ? null
          : UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AgreementsDataImplToJson(
        _$AgreementsDataImpl instance) =>
    <String, dynamic>{
      'agreements': instance.agreements?.toJson(),
      'needsAction': instance.needsAction,
      'requiredActions': instance.requiredActions,
      'userInfo': instance.userInfo?.toJson(),
    };
