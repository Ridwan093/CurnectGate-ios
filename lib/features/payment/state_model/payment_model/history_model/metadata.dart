import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'item_paid.dart';

part 'metadata.freezed.dart';
part 'metadata.g.dart';

@freezed
class Metadata with _$Metadata {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory Metadata({
    int? duesCount,
    List<ItemPaid>? itemsPaid,
    String? paymentType,
    String? email,
    String? callbackUrl,
    int? walletFlowId,
    Map<String, dynamic>? initializationData,
  }) = _Metadata;

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  factory Metadata.safeFromJson(Map<String, dynamic>? json) {
    return Metadata(
      duesCount: NullSafetyHelper.safeInt(json?['dues_count']),
      itemsPaid:
          (NullSafetyHelper.safeList(json?['items_paid']))
              .map((e) => ItemPaid.safeFromJson(NullSafetyHelper.safeMap(e)))
              .toList(),
      paymentType: NullSafetyHelper.safeString(json?['payment_type']),
      email: NullSafetyHelper.safeString(json?['email']),
      callbackUrl: NullSafetyHelper.safeString(json?['callback_url']),
      walletFlowId: NullSafetyHelper.safeInt(json?['wallet_flow_id']),
      initializationData:
          (json is Map && json?['initialization_data'] is Map)
              ? Map<String, dynamic>.from(json?['initialization_data'])
              : null,
    );
  }

  factory Metadata.empty() => const Metadata(
    duesCount: 0,
    itemsPaid: [],
    paymentType: '',
    email: null,
    callbackUrl: null,
    walletFlowId: 0,
    initializationData: null,
  );
}
