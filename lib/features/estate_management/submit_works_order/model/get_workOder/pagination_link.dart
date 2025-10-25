import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_link.freezed.dart';
part 'pagination_link.g.dart';

@freezed
class PaginationLink with _$PaginationLink {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory PaginationLink({
    String? url,
    required String label,
    required bool active,
  }) = _PaginationLink;

  factory PaginationLink.fromJson(Map<String, dynamic> json) =>
      _$PaginationLinkFromJson(json);

  factory PaginationLink.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return PaginationLink.empty();
    return PaginationLink(
      url: NullSafetyHelper.safeString(json['url']),
      label: NullSafetyHelper.safeString(json['label']) ?? '',
      active: NullSafetyHelper.safeBool(json['active']) ?? false,
    );
  }

  factory PaginationLink.empty() => const PaginationLink(
        url: null,
        label: '',
        active: false,
      );
}