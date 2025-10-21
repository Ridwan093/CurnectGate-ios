import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'event_code_model.dart';

part 'event_codes_data_model.freezed.dart';
part 'event_codes_data_model.g.dart';

@freezed
class EventCodesData with _$EventCodesData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory EventCodesData({
    int? total,
    int? active,
    int? pending,
    int? expired,
    int? revoked,
    List<EventCode>? eventCodes,
  }) = _EventCodesData;

  factory EventCodesData.fromJson(Map<String, dynamic> json) =>
      _$EventCodesDataFromJson(json);

  factory EventCodesData.fromSafeJson(Map<String, dynamic> json) {
    return EventCodesData(
      total: NullSafetyHelper.safeInt(json['total']),
      active: NullSafetyHelper.safeInt(json['active']),
      pending: NullSafetyHelper.safeInt(json['pending']),
      expired: NullSafetyHelper.safeInt(json['expired']),
      revoked: NullSafetyHelper.safeInt(json['revoked']),
      eventCodes: _listFromJson(json['event_codes']),
    );
  }

  static List<EventCode>? _listFromJson(dynamic value) {
    if (value == null) return null;
    if (value is! List) return <EventCode>[];

    return value
        .map(
          (item) => NullSafetyHelper.safeModel(
            item,
            EventCode.fromSafeJson,
            EventCode.empty(),
          ),
        )
        .whereType<EventCode>()
        .toList();
  }

  factory EventCodesData.empty() => const EventCodesData(
        total: null,
        active: null,
        pending: null,
        expired: null,
        revoked: null,
        eventCodes: null,
      );
}
