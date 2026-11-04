import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'page_link.freezed.dart';
part 'page_link.g.dart';

@freezed
class PageLink with _$PageLink {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory PageLink({
    String? url,
    String? label,
    bool? active,
  }) = _PageLink;

  factory PageLink.fromJson(Map<String, dynamic> json) => _$PageLinkFromJson(json);

  factory PageLink.safeFromJson(Map<String, dynamic>? json) {
    return PageLink(
      url: NullSafetyHelper.safeString(json?['url']),
      label: NullSafetyHelper.safeString(json?['label']),
      active: NullSafetyHelper.safeBool(json?['active']),
    );
  }

  factory PageLink.empty() => const PageLink(url: null, label: '', active: false);
}
