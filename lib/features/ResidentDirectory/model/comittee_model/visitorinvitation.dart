

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
part 'visitorinvitation.freezed.dart';
part 'visitorinvitation.g.dart';


@freezed
class VisitorInvitation with _$VisitorInvitation {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory VisitorInvitation({bool? enabled}) = _VisitorInvitation;

  factory VisitorInvitation.fromJson(Map<String, dynamic> json) =>
      _$VisitorInvitationFromJson(json);

  factory VisitorInvitation.fromSafeJson(Map<String, dynamic> json) {
    return VisitorInvitation(enabled: NullSafetyHelper.safeBool(json['enabled']));
  }

  factory VisitorInvitation.empty() => const VisitorInvitation(enabled: null);
}