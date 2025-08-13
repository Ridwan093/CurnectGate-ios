// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OtpDataImpl _$$OtpDataImplFromJson(Map<String, dynamic> json) =>
    _$OtpDataImpl(
      otps: (json['otps'] as List<dynamic>?)
              ?.map((e) => Otp.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      summary: Summary.fromJson(json['summary'] as Map<String, dynamic>),
      filtersApplied:
          json['filtersApplied'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$OtpDataImplToJson(_$OtpDataImpl instance) =>
    <String, dynamic>{
      'otps': instance.otps,
      'pagination': instance.pagination,
      'summary': instance.summary,
      'filtersApplied': instance.filtersApplied,
    };
