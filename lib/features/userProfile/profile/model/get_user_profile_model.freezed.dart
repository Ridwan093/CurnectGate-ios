// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_user_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetUserProfile _$GetUserProfileFromJson(Map<String, dynamic> json) {
  return _GetUserProfile.fromJson(json);
}

/// @nodoc
mixin _$GetUserProfile {
  bool get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  Data get data => throw _privateConstructorUsedError;

  /// Serializes this GetUserProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetUserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetUserProfileCopyWith<GetUserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserProfileCopyWith<$Res> {
  factory $GetUserProfileCopyWith(
          GetUserProfile value, $Res Function(GetUserProfile) then) =
      _$GetUserProfileCopyWithImpl<$Res, GetUserProfile>;
  @useResult
  $Res call({bool status, String message, int code, Data data});

  $DataCopyWith<$Res> get data;
}

/// @nodoc
class _$GetUserProfileCopyWithImpl<$Res, $Val extends GetUserProfile>
    implements $GetUserProfileCopyWith<$Res> {
  _$GetUserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetUserProfile
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
              as Data,
    ) as $Val);
  }

  /// Create a copy of GetUserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res> get data {
    return $DataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetUserProfileImplCopyWith<$Res>
    implements $GetUserProfileCopyWith<$Res> {
  factory _$$GetUserProfileImplCopyWith(_$GetUserProfileImpl value,
          $Res Function(_$GetUserProfileImpl) then) =
      __$$GetUserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool status, String message, int code, Data data});

  @override
  $DataCopyWith<$Res> get data;
}

/// @nodoc
class __$$GetUserProfileImplCopyWithImpl<$Res>
    extends _$GetUserProfileCopyWithImpl<$Res, _$GetUserProfileImpl>
    implements _$$GetUserProfileImplCopyWith<$Res> {
  __$$GetUserProfileImplCopyWithImpl(
      _$GetUserProfileImpl _value, $Res Function(_$GetUserProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetUserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? code = null,
    Object? data = null,
  }) {
    return _then(_$GetUserProfileImpl(
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
              as Data,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetUserProfileImpl implements _GetUserProfile {
  const _$GetUserProfileImpl(
      {this.status = false,
      this.message = '',
      this.code = 0,
      required this.data});

  factory _$GetUserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetUserProfileImplFromJson(json);

  @override
  @JsonKey()
  final bool status;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final int code;
  @override
  final Data data;

  @override
  String toString() {
    return 'GetUserProfile(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserProfileImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of GetUserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserProfileImplCopyWith<_$GetUserProfileImpl> get copyWith =>
      __$$GetUserProfileImplCopyWithImpl<_$GetUserProfileImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetUserProfileImplToJson(
      this,
    );
  }
}

abstract class _GetUserProfile implements GetUserProfile {
  const factory _GetUserProfile(
      {final bool status,
      final String message,
      final int code,
      required final Data data}) = _$GetUserProfileImpl;

  factory _GetUserProfile.fromJson(Map<String, dynamic> json) =
      _$GetUserProfileImpl.fromJson;

  @override
  bool get status;
  @override
  String get message;
  @override
  int get code;
  @override
  Data get data;

  /// Create a copy of GetUserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetUserProfileImplCopyWith<_$GetUserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
