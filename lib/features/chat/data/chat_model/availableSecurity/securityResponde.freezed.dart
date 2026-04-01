// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'securityResponde.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SecurityPersonnelResponse _$SecurityPersonnelResponseFromJson(
    Map<String, dynamic> json) {
  return _SecurityPersonnelResponse.fromJson(json);
}

/// @nodoc
mixin _$SecurityPersonnelResponse {
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  SecurityPersonnelData? get data => throw _privateConstructorUsedError;

  /// Serializes this SecurityPersonnelResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SecurityPersonnelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SecurityPersonnelResponseCopyWith<SecurityPersonnelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecurityPersonnelResponseCopyWith<$Res> {
  factory $SecurityPersonnelResponseCopyWith(SecurityPersonnelResponse value,
          $Res Function(SecurityPersonnelResponse) then) =
      _$SecurityPersonnelResponseCopyWithImpl<$Res, SecurityPersonnelResponse>;
  @useResult
  $Res call({bool? success, String? message, SecurityPersonnelData? data});

  $SecurityPersonnelDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$SecurityPersonnelResponseCopyWithImpl<$Res,
        $Val extends SecurityPersonnelResponse>
    implements $SecurityPersonnelResponseCopyWith<$Res> {
  _$SecurityPersonnelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SecurityPersonnelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SecurityPersonnelData?,
    ) as $Val);
  }

  /// Create a copy of SecurityPersonnelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SecurityPersonnelDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $SecurityPersonnelDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SecurityPersonnelResponseImplCopyWith<$Res>
    implements $SecurityPersonnelResponseCopyWith<$Res> {
  factory _$$SecurityPersonnelResponseImplCopyWith(
          _$SecurityPersonnelResponseImpl value,
          $Res Function(_$SecurityPersonnelResponseImpl) then) =
      __$$SecurityPersonnelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, String? message, SecurityPersonnelData? data});

  @override
  $SecurityPersonnelDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$SecurityPersonnelResponseImplCopyWithImpl<$Res>
    extends _$SecurityPersonnelResponseCopyWithImpl<$Res,
        _$SecurityPersonnelResponseImpl>
    implements _$$SecurityPersonnelResponseImplCopyWith<$Res> {
  __$$SecurityPersonnelResponseImplCopyWithImpl(
      _$SecurityPersonnelResponseImpl _value,
      $Res Function(_$SecurityPersonnelResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SecurityPersonnelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$SecurityPersonnelResponseImpl(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SecurityPersonnelData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$SecurityPersonnelResponseImpl implements _SecurityPersonnelResponse {
  const _$SecurityPersonnelResponseImpl(
      {this.success, this.message, this.data});

  factory _$SecurityPersonnelResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SecurityPersonnelResponseImplFromJson(json);

  @override
  final bool? success;
  @override
  final String? message;
  @override
  final SecurityPersonnelData? data;

  @override
  String toString() {
    return 'SecurityPersonnelResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SecurityPersonnelResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of SecurityPersonnelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SecurityPersonnelResponseImplCopyWith<_$SecurityPersonnelResponseImpl>
      get copyWith => __$$SecurityPersonnelResponseImplCopyWithImpl<
          _$SecurityPersonnelResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SecurityPersonnelResponseImplToJson(
      this,
    );
  }
}

abstract class _SecurityPersonnelResponse implements SecurityPersonnelResponse {
  const factory _SecurityPersonnelResponse(
      {final bool? success,
      final String? message,
      final SecurityPersonnelData? data}) = _$SecurityPersonnelResponseImpl;

  factory _SecurityPersonnelResponse.fromJson(Map<String, dynamic> json) =
      _$SecurityPersonnelResponseImpl.fromJson;

  @override
  bool? get success;
  @override
  String? get message;
  @override
  SecurityPersonnelData? get data;

  /// Create a copy of SecurityPersonnelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SecurityPersonnelResponseImplCopyWith<_$SecurityPersonnelResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
