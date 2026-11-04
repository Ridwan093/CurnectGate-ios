import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_requester_model.freezed.dart';
part 'event_requester_model.g.dart';

@freezed
class EventRequester with _$EventRequester {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory EventRequester({
    int? id,
    String? name,
    String? email,
    String? phone,
  }) = _EventRequester;

  factory EventRequester.fromJson(Map<String, dynamic> json) =>
      _$EventRequesterFromJson(json);

  factory EventRequester.fromSafeJson(Map<String, dynamic> json) {
    return EventRequester(
      id: NullSafetyHelper.safeInt(json['id']),
      name: NullSafetyHelper.safeString(json['name']),
      email: NullSafetyHelper.safeString(json['email']),
      phone: NullSafetyHelper.safeString(json['phone']),
    );
  }

  factory EventRequester.empty() => const EventRequester(
        id: null,
        name: null,
        email: null,
        phone: null,
      );
}
