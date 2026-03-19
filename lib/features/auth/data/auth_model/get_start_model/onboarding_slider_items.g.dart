// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_slider_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SliderItemImpl _$$SliderItemImplFromJson(Map<String, dynamic> json) =>
    _$SliderItemImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      order: (json['order'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SliderItemImplToJson(_$SliderItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'order': instance.order,
    };
