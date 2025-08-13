import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'visitor_invitation.freezed.dart';
part 'visitor_invitation.g.dart';

@freezed
class VisitorInvitation with _$VisitorInvitation {
  const factory VisitorInvitation({
    required bool enabled,
  }) = _VisitorInvitation;

  factory VisitorInvitation.fromJson(Map<String, dynamic> json) =>
      _$VisitorInvitationFromJson(json);

  factory VisitorInvitation.safeFromJson(Map<String, dynamic>? json) {
    return VisitorInvitation(
      enabled: NullSafetyHelper.safeBool(json?['enabled']),
    );
  }

  factory VisitorInvitation.empty() => const VisitorInvitation(enabled: false);
}
