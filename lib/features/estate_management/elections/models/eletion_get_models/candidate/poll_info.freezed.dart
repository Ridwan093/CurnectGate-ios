// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poll_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PollInfo _$PollInfoFromJson(Map<String, dynamic> json) {
  return _PollInfo.fromJson(json);
}

/// @nodoc
mixin _$PollInfo {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;

  /// Serializes this PollInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PollInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PollInfoCopyWith<PollInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollInfoCopyWith<$Res> {
  factory $PollInfoCopyWith(PollInfo value, $Res Function(PollInfo) then) =
      _$PollInfoCopyWithImpl<$Res, PollInfo>;
  @useResult
  $Res call({int? id, String? title});
}

/// @nodoc
class _$PollInfoCopyWithImpl<$Res, $Val extends PollInfo>
    implements $PollInfoCopyWith<$Res> {
  _$PollInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PollInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PollInfoImplCopyWith<$Res>
    implements $PollInfoCopyWith<$Res> {
  factory _$$PollInfoImplCopyWith(
          _$PollInfoImpl value, $Res Function(_$PollInfoImpl) then) =
      __$$PollInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? title});
}

/// @nodoc
class __$$PollInfoImplCopyWithImpl<$Res>
    extends _$PollInfoCopyWithImpl<$Res, _$PollInfoImpl>
    implements _$$PollInfoImplCopyWith<$Res> {
  __$$PollInfoImplCopyWithImpl(
      _$PollInfoImpl _value, $Res Function(_$PollInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PollInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_$PollInfoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$PollInfoImpl implements _PollInfo {
  const _$PollInfoImpl({this.id, this.title});

  factory _$PollInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PollInfoImplFromJson(json);

  @override
  final int? id;
  @override
  final String? title;

  @override
  String toString() {
    return 'PollInfo(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PollInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  /// Create a copy of PollInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PollInfoImplCopyWith<_$PollInfoImpl> get copyWith =>
      __$$PollInfoImplCopyWithImpl<_$PollInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PollInfoImplToJson(
      this,
    );
  }
}

abstract class _PollInfo implements PollInfo {
  const factory _PollInfo({final int? id, final String? title}) =
      _$PollInfoImpl;

  factory _PollInfo.fromJson(Map<String, dynamic> json) =
      _$PollInfoImpl.fromJson;

  @override
  int? get id;
  @override
  String? get title;

  /// Create a copy of PollInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PollInfoImplCopyWith<_$PollInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
