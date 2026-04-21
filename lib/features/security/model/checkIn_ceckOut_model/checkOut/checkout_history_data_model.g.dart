// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_history_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


_$CheckoutHistoryDataImpl _$$CheckoutHistoryDataImplFromJson(
        Map<String, dynamic> json) =>
    _$CheckoutHistoryDataImpl(
      history: (json['history'] as List<dynamic>?)
          ?.map((e) => VisitorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num?)?.toInt(),
      showingMyVisitorsOnly: json['showingMyVisitorsOnly'] as bool?,
    );

Map<String, dynamic> _$$CheckoutHistoryDataImplToJson(
        _$CheckoutHistoryDataImpl instance) =>
    <String, dynamic>{
      'history': instance.history,
      'count': instance.count,
      'showingMyVisitorsOnly': instance.showingMyVisitorsOnly,
    };
