import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  @JsonSerializable(explicitToJson: true)
  const factory Category({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String type,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  factory Category.safeFromJson(Map<String, dynamic>? json) {
    final map = NullSafetyHelper.safeMap(json);

    return Category(
      id: NullSafetyHelper.safeInt(map['id']),
      name: NullSafetyHelper.safeString(map['name']),
      type: NullSafetyHelper.safeString(map['type']),
    );
  }
}
