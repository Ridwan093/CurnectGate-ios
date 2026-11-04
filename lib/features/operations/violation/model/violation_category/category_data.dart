import 'package:freezed_annotation/freezed_annotation.dart';
import 'category.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'category_data.freezed.dart';
part 'category_data.g.dart';

@freezed
class CategoryData with _$CategoryData {
  const factory CategoryData({
    List<Category>? categories,
    int? total,
  }) = _CategoryData;

  factory CategoryData.safeFromJson(Map<String, dynamic>? json) {
    return CategoryData(
      categories: NullSafetyHelper.safeList(json?['categories'])
          .map((e) => Category.fromJson(e))
          .toList(),
      total: NullSafetyHelper.safeInt(json?['total']),
    );
  }

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);
}
