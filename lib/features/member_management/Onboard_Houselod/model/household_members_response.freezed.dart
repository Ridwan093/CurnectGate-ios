// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'household_members_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HouseholdMembersResponse _$HouseholdMembersResponseFromJson(
    Map<String, dynamic> json) {
  return _HouseholdMembersResponse.fromJson(json);
}

/// @nodoc
mixin _$HouseholdMembersResponse {
  @JsonKey(name: 'status')
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'code')
  int? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  HouseholdData? get data => throw _privateConstructorUsedError;

  /// Serializes this HouseholdMembersResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HouseholdMembersResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HouseholdMembersResponseCopyWith<HouseholdMembersResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseholdMembersResponseCopyWith<$Res> {
  factory $HouseholdMembersResponseCopyWith(HouseholdMembersResponse value,
          $Res Function(HouseholdMembersResponse) then) =
      _$HouseholdMembersResponseCopyWithImpl<$Res, HouseholdMembersResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'code') int? code,
      @JsonKey(name: 'data') HouseholdData? data});

  $HouseholdDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$HouseholdMembersResponseCopyWithImpl<$Res,
        $Val extends HouseholdMembersResponse>
    implements $HouseholdMembersResponseCopyWith<$Res> {
  _$HouseholdMembersResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HouseholdMembersResponse
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
              as HouseholdData?,
    ) as $Val);
  }

  /// Create a copy of HouseholdMembersResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HouseholdDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $HouseholdDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HouseholdMembersResponseImplCopyWith<$Res>
    implements $HouseholdMembersResponseCopyWith<$Res> {
  factory _$$HouseholdMembersResponseImplCopyWith(
          _$HouseholdMembersResponseImpl value,
          $Res Function(_$HouseholdMembersResponseImpl) then) =
      __$$HouseholdMembersResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'code') int? code,
      @JsonKey(name: 'data') HouseholdData? data});

  @override
  $HouseholdDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$HouseholdMembersResponseImplCopyWithImpl<$Res>
    extends _$HouseholdMembersResponseCopyWithImpl<$Res,
        _$HouseholdMembersResponseImpl>
    implements _$$HouseholdMembersResponseImplCopyWith<$Res> {
  __$$HouseholdMembersResponseImplCopyWithImpl(
      _$HouseholdMembersResponseImpl _value,
      $Res Function(_$HouseholdMembersResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of HouseholdMembersResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$HouseholdMembersResponseImpl(
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
              as HouseholdData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$HouseholdMembersResponseImpl implements _HouseholdMembersResponse {
  const _$HouseholdMembersResponseImpl(
      {@JsonKey(name: 'status') this.status,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'code') this.code,
      @JsonKey(name: 'data') this.data});

  factory _$HouseholdMembersResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HouseholdMembersResponseImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final bool? status;
  @override
  @JsonKey(name: 'message')
  final String? message;
  @override
  @JsonKey(name: 'code')
  final int? code;
  @override
  @JsonKey(name: 'data')
  final HouseholdData? data;

  @override
  String toString() {
    return 'HouseholdMembersResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseholdMembersResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of HouseholdMembersResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HouseholdMembersResponseImplCopyWith<_$HouseholdMembersResponseImpl>
      get copyWith => __$$HouseholdMembersResponseImplCopyWithImpl<
          _$HouseholdMembersResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HouseholdMembersResponseImplToJson(
      this,
    );
  }
}

abstract class _HouseholdMembersResponse implements HouseholdMembersResponse {
  const factory _HouseholdMembersResponse(
          {@JsonKey(name: 'status') final bool? status,
          @JsonKey(name: 'message') final String? message,
          @JsonKey(name: 'code') final int? code,
          @JsonKey(name: 'data') final HouseholdData? data}) =
      _$HouseholdMembersResponseImpl;

  factory _HouseholdMembersResponse.fromJson(Map<String, dynamic> json) =
      _$HouseholdMembersResponseImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool? get status;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'code')
  int? get code;
  @override
  @JsonKey(name: 'data')
  HouseholdData? get data;

  /// Create a copy of HouseholdMembersResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HouseholdMembersResponseImplCopyWith<_$HouseholdMembersResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
