// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status_badge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StatusBadge _$StatusBadgeFromJson(Map<String, dynamic> json) {
  return _StatusBadge.fromJson(json);
}

/// @nodoc
mixin _$StatusBadge {
  String? get text => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;

  /// Serializes this StatusBadge to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StatusBadge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatusBadgeCopyWith<StatusBadge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusBadgeCopyWith<$Res> {
  factory $StatusBadgeCopyWith(
          StatusBadge value, $Res Function(StatusBadge) then) =
      _$StatusBadgeCopyWithImpl<$Res, StatusBadge>;
  @useResult
  $Res call({String? text, String? color});
}

/// @nodoc
class _$StatusBadgeCopyWithImpl<$Res, $Val extends StatusBadge>
    implements $StatusBadgeCopyWith<$Res> {
  _$StatusBadgeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatusBadge
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatusBadgeImplCopyWith<$Res>
    implements $StatusBadgeCopyWith<$Res> {
  factory _$$StatusBadgeImplCopyWith(
          _$StatusBadgeImpl value, $Res Function(_$StatusBadgeImpl) then) =
      __$$StatusBadgeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? text, String? color});
}

/// @nodoc
class __$$StatusBadgeImplCopyWithImpl<$Res>
    extends _$StatusBadgeCopyWithImpl<$Res, _$StatusBadgeImpl>
    implements _$$StatusBadgeImplCopyWith<$Res> {
  __$$StatusBadgeImplCopyWithImpl(
      _$StatusBadgeImpl _value, $Res Function(_$StatusBadgeImpl) _then)
      : super(_value, _then);

  /// Create a copy of StatusBadge
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? color = freezed,
  }) {
    return _then(_$StatusBadgeImpl(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$StatusBadgeImpl implements _StatusBadge {
  const _$StatusBadgeImpl({this.text, this.color});

  factory _$StatusBadgeImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatusBadgeImplFromJson(json);

  @override
  final String? text;
  @override
  final String? color;

  @override
  String toString() {
    return 'StatusBadge(text: $text, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusBadgeImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, color);

  /// Create a copy of StatusBadge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusBadgeImplCopyWith<_$StatusBadgeImpl> get copyWith =>
      __$$StatusBadgeImplCopyWithImpl<_$StatusBadgeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatusBadgeImplToJson(
      this,
    );
  }
}

abstract class _StatusBadge implements StatusBadge {
  const factory _StatusBadge({final String? text, final String? color}) =
      _$StatusBadgeImpl;

  factory _StatusBadge.fromJson(Map<String, dynamic> json) =
      _$StatusBadgeImpl.fromJson;

  @override
  String? get text;
  @override
  String? get color;

  /// Create a copy of StatusBadge
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusBadgeImplCopyWith<_$StatusBadgeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
