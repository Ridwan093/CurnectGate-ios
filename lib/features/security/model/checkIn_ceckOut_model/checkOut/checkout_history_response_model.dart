// checkout_history_response_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'checkout_history_data_model.dart';

part 'checkout_history_response_model.freezed.dart';
part 'checkout_history_response_model.g.dart';

@freezed

class CheckoutHistoryResponseModel with _$CheckoutHistoryResponseModel {
@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory CheckoutHistoryResponseModel({
    bool? status,
    String? message,
    int? code,
    CheckoutHistoryData? data,
  }) = _CheckoutHistoryResponseModel;

  factory CheckoutHistoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CheckoutHistoryResponseModelFromJson(json);

  factory CheckoutHistoryResponseModel.fromSafeJson(Map<String, dynamic> json) {
    return CheckoutHistoryResponseModel(
      status: NullSafetyHelper.safeBool(json['status']),
      message: NullSafetyHelper.safeString(json['message']),
      code: NullSafetyHelper.safeInt(json['code']),
      data: NullSafetyHelper.safeModel(
        json['data'],
        CheckoutHistoryData.fromSafeJson, // Use fromSafeJson, not fromJson
        CheckoutHistoryData.empty(),
      ),
    );
  }



  factory CheckoutHistoryResponseModel.empty() =>
      const CheckoutHistoryResponseModel(
        status: false,
        message: '',
        code: 0,
        data: null,
      );
}
