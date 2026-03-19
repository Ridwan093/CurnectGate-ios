// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_slider_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OnboardingSliderResponseImpl _$$OnboardingSliderResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$OnboardingSliderResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : SliderData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OnboardingSliderResponseImplToJson(
        _$OnboardingSliderResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };
