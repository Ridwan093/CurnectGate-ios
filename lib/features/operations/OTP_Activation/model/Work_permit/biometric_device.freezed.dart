// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'biometric_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BiometricDevice _$BiometricDeviceFromJson(Map<String, dynamic> json) {
  return _BiometricDevice.fromJson(json);
}

/// @nodoc
mixin _$BiometricDevice {
  String? get token => throw _privateConstructorUsedError;
  String? get lastUsed => throw _privateConstructorUsedError;
  Map<String, dynamic>? get deviceInfo => throw _privateConstructorUsedError;
  String? get registeredAt => throw _privateConstructorUsedError;

  /// Serializes this BiometricDevice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BiometricDevice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BiometricDeviceCopyWith<BiometricDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BiometricDeviceCopyWith<$Res> {
  factory $BiometricDeviceCopyWith(
          BiometricDevice value, $Res Function(BiometricDevice) then) =
      _$BiometricDeviceCopyWithImpl<$Res, BiometricDevice>;
  @useResult
  $Res call(
      {String? token,
      String? lastUsed,
      Map<String, dynamic>? deviceInfo,
      String? registeredAt});
}

/// @nodoc
class _$BiometricDeviceCopyWithImpl<$Res, $Val extends BiometricDevice>
    implements $BiometricDeviceCopyWith<$Res> {
  _$BiometricDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BiometricDevice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? lastUsed = freezed,
    Object? deviceInfo = freezed,
    Object? registeredAt = freezed,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUsed: freezed == lastUsed
          ? _value.lastUsed
          : lastUsed // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceInfo: freezed == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      registeredAt: freezed == registeredAt
          ? _value.registeredAt
          : registeredAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BiometricDeviceImplCopyWith<$Res>
    implements $BiometricDeviceCopyWith<$Res> {
  factory _$$BiometricDeviceImplCopyWith(_$BiometricDeviceImpl value,
          $Res Function(_$BiometricDeviceImpl) then) =
      __$$BiometricDeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? token,
      String? lastUsed,
      Map<String, dynamic>? deviceInfo,
      String? registeredAt});
}

/// @nodoc
class __$$BiometricDeviceImplCopyWithImpl<$Res>
    extends _$BiometricDeviceCopyWithImpl<$Res, _$BiometricDeviceImpl>
    implements _$$BiometricDeviceImplCopyWith<$Res> {
  __$$BiometricDeviceImplCopyWithImpl(
      _$BiometricDeviceImpl _value, $Res Function(_$BiometricDeviceImpl) _then)
      : super(_value, _then);

  /// Create a copy of BiometricDevice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? lastUsed = freezed,
    Object? deviceInfo = freezed,
    Object? registeredAt = freezed,
  }) {
    return _then(_$BiometricDeviceImpl(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUsed: freezed == lastUsed
          ? _value.lastUsed
          : lastUsed // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceInfo: freezed == deviceInfo
          ? _value._deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      registeredAt: freezed == registeredAt
          ? _value.registeredAt
          : registeredAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$BiometricDeviceImpl implements _BiometricDevice {
  const _$BiometricDeviceImpl(
      {this.token,
      this.lastUsed,
      final Map<String, dynamic>? deviceInfo,
      this.registeredAt})
      : _deviceInfo = deviceInfo;

  factory _$BiometricDeviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$BiometricDeviceImplFromJson(json);

  @override
  final String? token;
  @override
  final String? lastUsed;
  final Map<String, dynamic>? _deviceInfo;
  @override
  Map<String, dynamic>? get deviceInfo {
    final value = _deviceInfo;
    if (value == null) return null;
    if (_deviceInfo is EqualUnmodifiableMapView) return _deviceInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? registeredAt;

  @override
  String toString() {
    return 'BiometricDevice(token: $token, lastUsed: $lastUsed, deviceInfo: $deviceInfo, registeredAt: $registeredAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BiometricDeviceImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.lastUsed, lastUsed) ||
                other.lastUsed == lastUsed) &&
            const DeepCollectionEquality()
                .equals(other._deviceInfo, _deviceInfo) &&
            (identical(other.registeredAt, registeredAt) ||
                other.registeredAt == registeredAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, lastUsed,
      const DeepCollectionEquality().hash(_deviceInfo), registeredAt);

  /// Create a copy of BiometricDevice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BiometricDeviceImplCopyWith<_$BiometricDeviceImpl> get copyWith =>
      __$$BiometricDeviceImplCopyWithImpl<_$BiometricDeviceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BiometricDeviceImplToJson(
      this,
    );
  }
}

abstract class _BiometricDevice implements BiometricDevice {
  const factory _BiometricDevice(
      {final String? token,
      final String? lastUsed,
      final Map<String, dynamic>? deviceInfo,
      final String? registeredAt}) = _$BiometricDeviceImpl;

  factory _BiometricDevice.fromJson(Map<String, dynamic> json) =
      _$BiometricDeviceImpl.fromJson;

  @override
  String? get token;
  @override
  String? get lastUsed;
  @override
  Map<String, dynamic>? get deviceInfo;
  @override
  String? get registeredAt;

  /// Create a copy of BiometricDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BiometricDeviceImplCopyWith<_$BiometricDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
