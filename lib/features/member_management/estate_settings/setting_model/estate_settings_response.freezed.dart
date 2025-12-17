// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'estate_settings_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EstateSettingsResponse _$EstateSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return _EstateSettingsResponse.fromJson(json);
}

/// @nodoc
mixin _$EstateSettingsResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  EstateSettingsData? get data => throw _privateConstructorUsedError;

  /// Serializes this EstateSettingsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EstateSettingsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EstateSettingsResponseCopyWith<EstateSettingsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EstateSettingsResponseCopyWith<$Res> {
  factory $EstateSettingsResponseCopyWith(EstateSettingsResponse value,
          $Res Function(EstateSettingsResponse) then) =
      _$EstateSettingsResponseCopyWithImpl<$Res, EstateSettingsResponse>;
  @useResult
  $Res call(
      {bool? status, String? message, int? code, EstateSettingsData? data});

  $EstateSettingsDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$EstateSettingsResponseCopyWithImpl<$Res,
        $Val extends EstateSettingsResponse>
    implements $EstateSettingsResponseCopyWith<$Res> {
  _$EstateSettingsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EstateSettingsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as EstateSettingsData?,
    ) as $Val);
  }

  /// Create a copy of EstateSettingsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EstateSettingsDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $EstateSettingsDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EstateSettingsResponseImplCopyWith<$Res>
    implements $EstateSettingsResponseCopyWith<$Res> {
  factory _$$EstateSettingsResponseImplCopyWith(
          _$EstateSettingsResponseImpl value,
          $Res Function(_$EstateSettingsResponseImpl) then) =
      __$$EstateSettingsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? status, String? message, int? code, EstateSettingsData? data});

  @override
  $EstateSettingsDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$EstateSettingsResponseImplCopyWithImpl<$Res>
    extends _$EstateSettingsResponseCopyWithImpl<$Res,
        _$EstateSettingsResponseImpl>
    implements _$$EstateSettingsResponseImplCopyWith<$Res> {
  __$$EstateSettingsResponseImplCopyWithImpl(
      _$EstateSettingsResponseImpl _value,
      $Res Function(_$EstateSettingsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of EstateSettingsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$EstateSettingsResponseImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as EstateSettingsData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$EstateSettingsResponseImpl implements _EstateSettingsResponse {
  const _$EstateSettingsResponseImpl(
      {this.status, this.message, this.code, this.data});

  factory _$EstateSettingsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EstateSettingsResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final EstateSettingsData? data;

  @override
  String toString() {
    return 'EstateSettingsResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EstateSettingsResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of EstateSettingsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EstateSettingsResponseImplCopyWith<_$EstateSettingsResponseImpl>
      get copyWith => __$$EstateSettingsResponseImplCopyWithImpl<
          _$EstateSettingsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EstateSettingsResponseImplToJson(
      this,
    );
  }
}

abstract class _EstateSettingsResponse implements EstateSettingsResponse {
  const factory _EstateSettingsResponse(
      {final bool? status,
      final String? message,
      final int? code,
      final EstateSettingsData? data}) = _$EstateSettingsResponseImpl;

  factory _EstateSettingsResponse.fromJson(Map<String, dynamic> json) =
      _$EstateSettingsResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  EstateSettingsData? get data;

  /// Create a copy of EstateSettingsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EstateSettingsResponseImplCopyWith<_$EstateSettingsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
