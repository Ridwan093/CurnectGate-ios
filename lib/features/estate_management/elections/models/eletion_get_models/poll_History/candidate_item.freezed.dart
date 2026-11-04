// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'candidate_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CandidateItem _$CandidateItemFromJson(Map<String, dynamic> json) {
  return _CandidateItem.fromJson(json);
}

/// @nodoc
mixin _$CandidateItem {
  String? get name => throw _privateConstructorUsedError;
  String? get mediaUrl => throw _privateConstructorUsedError;

  /// Serializes this CandidateItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CandidateItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CandidateItemCopyWith<CandidateItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandidateItemCopyWith<$Res> {
  factory $CandidateItemCopyWith(
          CandidateItem value, $Res Function(CandidateItem) then) =
      _$CandidateItemCopyWithImpl<$Res, CandidateItem>;
  @useResult
  $Res call({String? name, String? mediaUrl});
}

/// @nodoc
class _$CandidateItemCopyWithImpl<$Res, $Val extends CandidateItem>
    implements $CandidateItemCopyWith<$Res> {
  _$CandidateItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CandidateItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? mediaUrl = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CandidateItemImplCopyWith<$Res>
    implements $CandidateItemCopyWith<$Res> {
  factory _$$CandidateItemImplCopyWith(
          _$CandidateItemImpl value, $Res Function(_$CandidateItemImpl) then) =
      __$$CandidateItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? mediaUrl});
}

/// @nodoc
class __$$CandidateItemImplCopyWithImpl<$Res>
    extends _$CandidateItemCopyWithImpl<$Res, _$CandidateItemImpl>
    implements _$$CandidateItemImplCopyWith<$Res> {
  __$$CandidateItemImplCopyWithImpl(
      _$CandidateItemImpl _value, $Res Function(_$CandidateItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of CandidateItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? mediaUrl = freezed,
  }) {
    return _then(_$CandidateItemImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$CandidateItemImpl implements _CandidateItem {
  const _$CandidateItemImpl({this.name, this.mediaUrl});

  factory _$CandidateItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CandidateItemImplFromJson(json);

  @override
  final String? name;
  @override
  final String? mediaUrl;

  @override
  String toString() {
    return 'CandidateItem(name: $name, mediaUrl: $mediaUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateItemImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, mediaUrl);

  /// Create a copy of CandidateItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CandidateItemImplCopyWith<_$CandidateItemImpl> get copyWith =>
      __$$CandidateItemImplCopyWithImpl<_$CandidateItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CandidateItemImplToJson(
      this,
    );
  }
}

abstract class _CandidateItem implements CandidateItem {
  const factory _CandidateItem({final String? name, final String? mediaUrl}) =
      _$CandidateItemImpl;

  factory _CandidateItem.fromJson(Map<String, dynamic> json) =
      _$CandidateItemImpl.fromJson;

  @override
  String? get name;
  @override
  String? get mediaUrl;

  /// Create a copy of CandidateItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CandidateItemImplCopyWith<_$CandidateItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
