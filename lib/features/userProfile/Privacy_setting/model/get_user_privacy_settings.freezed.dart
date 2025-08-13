// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_user_privacy_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetUserPrivacySettings _$GetUserPrivacySettingsFromJson(
    Map<String, dynamic> json) {
  return _GetUserPrivacySettings.fromJson(json);
}

/// @nodoc
mixin _$GetUserPrivacySettings {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  Data? get data => throw _privateConstructorUsedError;

  /// Serializes this GetUserPrivacySettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetUserPrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetUserPrivacySettingsCopyWith<GetUserPrivacySettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserPrivacySettingsCopyWith<$Res> {
  factory $GetUserPrivacySettingsCopyWith(GetUserPrivacySettings value,
          $Res Function(GetUserPrivacySettings) then) =
      _$GetUserPrivacySettingsCopyWithImpl<$Res, GetUserPrivacySettings>;
  @useResult
  $Res call({bool? status, String? message, int? code, Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$GetUserPrivacySettingsCopyWithImpl<$Res,
        $Val extends GetUserPrivacySettings>
    implements $GetUserPrivacySettingsCopyWith<$Res> {
  _$GetUserPrivacySettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetUserPrivacySettings
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
              as Data?,
    ) as $Val);
  }

  /// Create a copy of GetUserPrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetUserPrivacySettingsImplCopyWith<$Res>
    implements $GetUserPrivacySettingsCopyWith<$Res> {
  factory _$$GetUserPrivacySettingsImplCopyWith(
          _$GetUserPrivacySettingsImpl value,
          $Res Function(_$GetUserPrivacySettingsImpl) then) =
      __$$GetUserPrivacySettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, String? message, int? code, Data? data});

  @override
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$GetUserPrivacySettingsImplCopyWithImpl<$Res>
    extends _$GetUserPrivacySettingsCopyWithImpl<$Res,
        _$GetUserPrivacySettingsImpl>
    implements _$$GetUserPrivacySettingsImplCopyWith<$Res> {
  __$$GetUserPrivacySettingsImplCopyWithImpl(
      _$GetUserPrivacySettingsImpl _value,
      $Res Function(_$GetUserPrivacySettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetUserPrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$GetUserPrivacySettingsImpl(
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
              as Data?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetUserPrivacySettingsImpl implements _GetUserPrivacySettings {
  const _$GetUserPrivacySettingsImpl(
      {this.status, this.message, this.code, this.data});

  factory _$GetUserPrivacySettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetUserPrivacySettingsImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final Data? data;

  @override
  String toString() {
    return 'GetUserPrivacySettings(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserPrivacySettingsImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of GetUserPrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserPrivacySettingsImplCopyWith<_$GetUserPrivacySettingsImpl>
      get copyWith => __$$GetUserPrivacySettingsImplCopyWithImpl<
          _$GetUserPrivacySettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetUserPrivacySettingsImplToJson(
      this,
    );
  }
}

abstract class _GetUserPrivacySettings implements GetUserPrivacySettings {
  const factory _GetUserPrivacySettings(
      {final bool? status,
      final String? message,
      final int? code,
      final Data? data}) = _$GetUserPrivacySettingsImpl;

  factory _GetUserPrivacySettings.fromJson(Map<String, dynamic> json) =
      _$GetUserPrivacySettingsImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  Data? get data;

  /// Create a copy of GetUserPrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetUserPrivacySettingsImplCopyWith<_$GetUserPrivacySettingsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
