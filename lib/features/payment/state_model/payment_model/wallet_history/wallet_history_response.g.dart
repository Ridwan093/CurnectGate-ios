// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletHistoryResponseImpl _$$WalletHistoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WalletHistoryResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : WalletHistoryData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WalletHistoryResponseImplToJson(
        _$WalletHistoryResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };
