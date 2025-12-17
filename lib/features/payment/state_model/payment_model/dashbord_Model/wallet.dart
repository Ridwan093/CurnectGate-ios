import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'wallet.freezed.dart';
part 'wallet.g.dart';

@freezed
class Wallet with _$Wallet {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory Wallet({
    int? id,
    int? userId,
    int? estateId,
    String? balance,
    int? notify,
    String? createdAt,
    String? updatedAt,
  }) = _Wallet;

  factory Wallet.fromJson(Map<String, dynamic> json) =>
      _$WalletFromJson(json);

  factory Wallet.safeFromJson(Map<String, dynamic>? json) {
    return Wallet(
      id: NullSafetyHelper.safeInt(json?['id']),
      userId: NullSafetyHelper.safeInt(json?['user_id']),
      estateId: NullSafetyHelper.safeInt(json?['estate_id']),
      balance: NullSafetyHelper.safeString(json?['balance']),
      notify: NullSafetyHelper.safeInt(json?['notify']),
      createdAt: NullSafetyHelper.safeString(json?['created_at']),
      updatedAt: NullSafetyHelper.safeString(json?['updated_at']),
    );
  }

  factory Wallet.empty() => const Wallet(
        id: 0,
        userId: 0,
        estateId: 0,
        balance: '0.00',
        notify: 0,
        createdAt: '',
        updatedAt: '',
      );
}
