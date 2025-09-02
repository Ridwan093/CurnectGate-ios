// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_link_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PageLink _$PageLinkFromJson(Map<String, dynamic> json) {
  return _PageLink.fromJson(json);
}

/// @nodoc
mixin _$PageLink {
  String? get url => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;

  /// Serializes this PageLink to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PageLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PageLinkCopyWith<PageLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageLinkCopyWith<$Res> {
  factory $PageLinkCopyWith(PageLink value, $Res Function(PageLink) then) =
      _$PageLinkCopyWithImpl<$Res, PageLink>;
  @useResult
  $Res call({String? url, String? label, bool? active});
}

/// @nodoc
class _$PageLinkCopyWithImpl<$Res, $Val extends PageLink>
    implements $PageLinkCopyWith<$Res> {
  _$PageLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PageLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? label = freezed,
    Object? active = freezed,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PageLinkImplCopyWith<$Res>
    implements $PageLinkCopyWith<$Res> {
  factory _$$PageLinkImplCopyWith(
          _$PageLinkImpl value, $Res Function(_$PageLinkImpl) then) =
      __$$PageLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? url, String? label, bool? active});
}

/// @nodoc
class __$$PageLinkImplCopyWithImpl<$Res>
    extends _$PageLinkCopyWithImpl<$Res, _$PageLinkImpl>
    implements _$$PageLinkImplCopyWith<$Res> {
  __$$PageLinkImplCopyWithImpl(
      _$PageLinkImpl _value, $Res Function(_$PageLinkImpl) _then)
      : super(_value, _then);

  /// Create a copy of PageLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? label = freezed,
    Object? active = freezed,
  }) {
    return _then(_$PageLinkImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$PageLinkImpl implements _PageLink {
  const _$PageLinkImpl({this.url, this.label, this.active});

  factory _$PageLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageLinkImplFromJson(json);

  @override
  final String? url;
  @override
  final String? label;
  @override
  final bool? active;

  @override
  String toString() {
    return 'PageLink(url: $url, label: $label, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageLinkImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, label, active);

  /// Create a copy of PageLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PageLinkImplCopyWith<_$PageLinkImpl> get copyWith =>
      __$$PageLinkImplCopyWithImpl<_$PageLinkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PageLinkImplToJson(
      this,
    );
  }
}

abstract class _PageLink implements PageLink {
  const factory _PageLink(
      {final String? url,
      final String? label,
      final bool? active}) = _$PageLinkImpl;

  factory _PageLink.fromJson(Map<String, dynamic> json) =
      _$PageLinkImpl.fromJson;

  @override
  String? get url;
  @override
  String? get label;
  @override
  bool? get active;

  /// Create a copy of PageLink
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PageLinkImplCopyWith<_$PageLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
