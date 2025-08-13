// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_user_notifications.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetuserNotifications _$GetuserNotificationsFromJson(Map<String, dynamic> json) {
  return _GetuserNotifications.fromJson(json);
}

/// @nodoc
mixin _$GetuserNotifications {
  bool get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  PreferenceData get data => throw _privateConstructorUsedError;

  /// Serializes this GetuserNotifications to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetuserNotifications
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetuserNotificationsCopyWith<GetuserNotifications> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetuserNotificationsCopyWith<$Res> {
  factory $GetuserNotificationsCopyWith(GetuserNotifications value,
          $Res Function(GetuserNotifications) then) =
      _$GetuserNotificationsCopyWithImpl<$Res, GetuserNotifications>;
  @useResult
  $Res call({bool status, String message, int code, PreferenceData data});

  $PreferenceDataCopyWith<$Res> get data;
}

/// @nodoc
class _$GetuserNotificationsCopyWithImpl<$Res,
        $Val extends GetuserNotifications>
    implements $GetuserNotificationsCopyWith<$Res> {
  _$GetuserNotificationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetuserNotifications
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? code = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PreferenceData,
    ) as $Val);
  }

  /// Create a copy of GetuserNotifications
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PreferenceDataCopyWith<$Res> get data {
    return $PreferenceDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetuserNotificationsImplCopyWith<$Res>
    implements $GetuserNotificationsCopyWith<$Res> {
  factory _$$GetuserNotificationsImplCopyWith(_$GetuserNotificationsImpl value,
          $Res Function(_$GetuserNotificationsImpl) then) =
      __$$GetuserNotificationsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool status, String message, int code, PreferenceData data});

  @override
  $PreferenceDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$GetuserNotificationsImplCopyWithImpl<$Res>
    extends _$GetuserNotificationsCopyWithImpl<$Res, _$GetuserNotificationsImpl>
    implements _$$GetuserNotificationsImplCopyWith<$Res> {
  __$$GetuserNotificationsImplCopyWithImpl(_$GetuserNotificationsImpl _value,
      $Res Function(_$GetuserNotificationsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetuserNotifications
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? code = null,
    Object? data = null,
  }) {
    return _then(_$GetuserNotificationsImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PreferenceData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetuserNotificationsImpl implements _GetuserNotifications {
  const _$GetuserNotificationsImpl(
      {required this.status,
      required this.message,
      required this.code,
      required this.data});

  factory _$GetuserNotificationsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetuserNotificationsImplFromJson(json);

  @override
  final bool status;
  @override
  final String message;
  @override
  final int code;
  @override
  final PreferenceData data;

  @override
  String toString() {
    return 'GetuserNotifications(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetuserNotificationsImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of GetuserNotifications
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetuserNotificationsImplCopyWith<_$GetuserNotificationsImpl>
      get copyWith =>
          __$$GetuserNotificationsImplCopyWithImpl<_$GetuserNotificationsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetuserNotificationsImplToJson(
      this,
    );
  }
}

abstract class _GetuserNotifications implements GetuserNotifications {
  const factory _GetuserNotifications(
      {required final bool status,
      required final String message,
      required final int code,
      required final PreferenceData data}) = _$GetuserNotificationsImpl;

  factory _GetuserNotifications.fromJson(Map<String, dynamic> json) =
      _$GetuserNotificationsImpl.fromJson;

  @override
  bool get status;
  @override
  String get message;
  @override
  int get code;
  @override
  PreferenceData get data;

  /// Create a copy of GetuserNotifications
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetuserNotificationsImplCopyWith<_$GetuserNotificationsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
