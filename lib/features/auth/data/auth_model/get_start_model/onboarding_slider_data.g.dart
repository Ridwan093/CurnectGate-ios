// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_slider_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SliderDataImpl _$$SliderDataImplFromJson(Map<String, dynamic> json) =>
    _$SliderDataImpl(
      sliders: (json['sliders'] as List<dynamic>?)
              ?.map((e) => SliderItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SliderDataImplToJson(_$SliderDataImpl instance) =>
    <String, dynamic>{
      'sliders': instance.sliders.map((e) => e.toJson()).toList(),
    };
