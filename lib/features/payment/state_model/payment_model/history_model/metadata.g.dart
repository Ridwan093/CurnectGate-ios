// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MetadataImpl _$$MetadataImplFromJson(Map<String, dynamic> json) =>
    _$MetadataImpl(
      duesCount: (json['dues_count'] as num?)?.toInt(),
      itemsPaid: (json['items_paid'] as List<dynamic>?)
          ?.map((e) => ItemPaid.fromJson(e as Map<String, dynamic>))
          .toList(),
      paymentType: json['payment_type'] as String?,
      email: json['email'] as String?,
      callbackUrl: json['callback_url'] as String?,
      walletFlowId: (json['wallet_flow_id'] as num?)?.toInt(),
      initializationData: json['initialization_data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$MetadataImplToJson(_$MetadataImpl instance) =>
    <String, dynamic>{
      'dues_count': instance.duesCount,
      'items_paid': instance.itemsPaid?.map((e) => e.toJson()).toList(),
      'payment_type': instance.paymentType,
      'email': instance.email,
      'callback_url': instance.callbackUrl,
      'wallet_flow_id': instance.walletFlowId,
      'initialization_data': instance.initializationData,
    };
