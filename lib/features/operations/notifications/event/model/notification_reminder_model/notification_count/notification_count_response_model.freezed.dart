// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_count_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationCountResponse _$NotificationCountResponseFromJson(
    Map<String, dynamic> json) {
  return _NotificationCountResponse.fromJson(json);
}

/// @nodoc
mixin _$NotificationCountResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  NotificationCountData? get data => throw _privateConstructorUsedError;

  /// Serializes this NotificationCountResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationCountResponseCopyWith<NotificationCountResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationCountResponseCopyWith<$Res> {
  factory $NotificationCountResponseCopyWith(NotificationCountResponse value,
          $Res Function(NotificationCountResponse) then) =
      _$NotificationCountResponseCopyWithImpl<$Res, NotificationCountResponse>;
  @useResult
  $Res call(
      {bool? status, String? message, int? code, NotificationCountData? data});

  $NotificationCountDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$NotificationCountResponseCopyWithImpl<$Res,
        $Val extends NotificationCountResponse>
    implements $NotificationCountResponseCopyWith<$Res> {
  _$NotificationCountResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationCountResponse
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
              as NotificationCountData?,
    ) as $Val);
  }

  /// Create a copy of NotificationCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationCountDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $NotificationCountDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotificationCountResponseImplCopyWith<$Res>
    implements $NotificationCountResponseCopyWith<$Res> {
  factory _$$NotificationCountResponseImplCopyWith(
          _$NotificationCountResponseImpl value,
          $Res Function(_$NotificationCountResponseImpl) then) =
      __$$NotificationCountResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? status, String? message, int? code, NotificationCountData? data});

  @override
  $NotificationCountDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$NotificationCountResponseImplCopyWithImpl<$Res>
    extends _$NotificationCountResponseCopyWithImpl<$Res,
        _$NotificationCountResponseImpl>
    implements _$$NotificationCountResponseImplCopyWith<$Res> {
  __$$NotificationCountResponseImplCopyWithImpl(
      _$NotificationCountResponseImpl _value,
      $Res Function(_$NotificationCountResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$NotificationCountResponseImpl(
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
              as NotificationCountData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$NotificationCountResponseImpl implements _NotificationCountResponse {
  const _$NotificationCountResponseImpl(
      {this.status, this.message, this.code, this.data});

  factory _$NotificationCountResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationCountResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final NotificationCountData? data;

  @override
  String toString() {
    return 'NotificationCountResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationCountResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of NotificationCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationCountResponseImplCopyWith<_$NotificationCountResponseImpl>
      get copyWith => __$$NotificationCountResponseImplCopyWithImpl<
          _$NotificationCountResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationCountResponseImplToJson(
      this,
    );
  }
}

abstract class _NotificationCountResponse implements NotificationCountResponse {
  const factory _NotificationCountResponse(
      {final bool? status,
      final String? message,
      final int? code,
      final NotificationCountData? data}) = _$NotificationCountResponseImpl;

  factory _NotificationCountResponse.fromJson(Map<String, dynamic> json) =
      _$NotificationCountResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  NotificationCountData? get data;

  /// Create a copy of NotificationCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationCountResponseImplCopyWith<_$NotificationCountResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
