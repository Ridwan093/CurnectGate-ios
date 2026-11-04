import 'package:freezed_annotation/freezed_annotation.dart';
import 'wallet_history_data.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'wallet_history_response.freezed.dart';
part 'wallet_history_response.g.dart';

@freezed
class WalletHistoryResponse with _$WalletHistoryResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory WalletHistoryResponse({
    bool? status,
    String? message,
    int? code,
    WalletHistoryData? data,
  }) = _WalletHistoryResponse;

  factory WalletHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$WalletHistoryResponseFromJson(json);

  factory WalletHistoryResponse.safeFromJson(Map<String, dynamic>? json) {
    return WalletHistoryResponse(
      status: NullSafetyHelper.safeBool(json?['status']),
      message: NullSafetyHelper.safeString(json?['message']),
      code: NullSafetyHelper.safeInt(json?['code']),
      data: WalletHistoryData.safeFromJson(NullSafetyHelper.safeMap(json?['data'])),
    );
  }

  factory WalletHistoryResponse.empty() =>
      const WalletHistoryResponse(status: false, message: '', code: 0, data: null);
}
