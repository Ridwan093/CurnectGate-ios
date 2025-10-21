import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'permit_item.dart';
import 'user.dart';
import 'property.dart';
import 'visitor_otp.dart';
import 'status_badge.dart';

part 'permit.freezed.dart';
part 'permit.g.dart';

@freezed
class Permit with _$Permit {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory Permit({
    int? id,
    int? estateId,
    int? propertyId,
    int? residentId,
    int? visitorOtpId,
    String? guestPhoneNumber,
    String? guestName,
    String? itemsDescription,
    dynamic estimatedValue,
    String? status,
    dynamic usedAt,
    dynamic usedBy,
    dynamic revokedAt,
    User? revokedBy,
    String? revocationReason,
    bool? isResolved,
    String? createdAt,
    String? updatedAt,
    StatusBadge? statusBadge,
    List<PermitItem>? items,
    VisitorOtp? visitorOtp,
    Property? property,
  }) = _Permit;

  factory Permit.fromJson(Map<String, dynamic> json) => _$PermitFromJson(json);

  factory Permit.fromSafeJson(Map<String, dynamic>? json) {
    if (json == null) return Permit.empty();
    return Permit(
      id: NullSafetyHelper.safeInt(json['id']),
      estateId: NullSafetyHelper.safeInt(json['estate_id']),
      propertyId: NullSafetyHelper.safeInt(json['property_id']),
      residentId: NullSafetyHelper.safeInt(json['resident_id']),
      visitorOtpId: NullSafetyHelper.safeInt(json['visitor_otp_id']),
      guestPhoneNumber: NullSafetyHelper.safeString(json['guest_phone_number']),
      guestName: NullSafetyHelper.safeString(json['guest_name']),
      itemsDescription: NullSafetyHelper.safeString(json['items_description']),
      estimatedValue: json['estimated_value'],
      status: NullSafetyHelper.safeString(json['status']),
      usedAt: json['used_at'],
      usedBy: json['used_by'],
      revokedAt: json['revoked_at'],
      revokedBy: NullSafetyHelper.safeModel(
        json['revoked_by'],
        User.fromSafeJson,
        User.empty(),
      ),
      revocationReason: NullSafetyHelper.safeString(json['revocation_reason']),
      isResolved: NullSafetyHelper.safeBool(json['is_resolved']),
      createdAt: NullSafetyHelper.safeString(json['created_at']),
      updatedAt: NullSafetyHelper.safeString(json['updated_at']),
      statusBadge: NullSafetyHelper.safeModel(
        json['status_badge'],
        StatusBadge.fromSafeJson,
        StatusBadge.empty(),
      ),
      items: NullSafetyHelper.safeList(json['items'])
          .map((e) => NullSafetyHelper.safeModel(
                e,
                PermitItem.fromSafeJson,
                PermitItem.empty(),
              ))
          .whereType<PermitItem>()
          .toList(),
      visitorOtp: NullSafetyHelper.safeModel(
        json['visitor_otp'],
        VisitorOtp.fromSafeJson,
        VisitorOtp.empty(),
      ),
      property: NullSafetyHelper.safeModel(
        json['property'],
        Property.fromSafeJson,
        Property.empty(),
      ),
    );
  }

  factory Permit.empty() => const Permit(
        id: null,
        estateId: null,
        propertyId: null,
        residentId: null,
        visitorOtpId: null,
        guestPhoneNumber: null,
        guestName: null,
        itemsDescription: null,
        estimatedValue: null,
        status: null,
        usedAt: null,
        usedBy: null,
        revokedAt: null,
        revokedBy: null,
        revocationReason: null,
        isResolved: null,
        createdAt: null,
        updatedAt: null,
        statusBadge: null,
        items: null,
        visitorOtp: null,
        property: null,
      );
}
