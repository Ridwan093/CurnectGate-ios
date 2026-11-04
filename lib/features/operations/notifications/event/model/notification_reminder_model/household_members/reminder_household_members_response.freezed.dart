// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder_household_members_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReminderHouseholdMembersResponse _$ReminderHouseholdMembersResponseFromJson(
    Map<String, dynamic> json) {
  return _ReminderHouseholdMembersResponse.fromJson(json);
}

/// @nodoc
mixin _$ReminderHouseholdMembersResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  ReminderHouseholdData? get data => throw _privateConstructorUsedError;

  /// Serializes this ReminderHouseholdMembersResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReminderHouseholdMembersResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReminderHouseholdMembersResponseCopyWith<ReminderHouseholdMembersResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderHouseholdMembersResponseCopyWith<$Res> {
  factory $ReminderHouseholdMembersResponseCopyWith(
          ReminderHouseholdMembersResponse value,
          $Res Function(ReminderHouseholdMembersResponse) then) =
      _$ReminderHouseholdMembersResponseCopyWithImpl<$Res,
          ReminderHouseholdMembersResponse>;
  @useResult
  $Res call(
      {bool? status, String? message, int? code, ReminderHouseholdData? data});

  $ReminderHouseholdDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ReminderHouseholdMembersResponseCopyWithImpl<$Res,
        $Val extends ReminderHouseholdMembersResponse>
    implements $ReminderHouseholdMembersResponseCopyWith<$Res> {
  _$ReminderHouseholdMembersResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReminderHouseholdMembersResponse
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
              as ReminderHouseholdData?,
    ) as $Val);
  }

  /// Create a copy of ReminderHouseholdMembersResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReminderHouseholdDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ReminderHouseholdDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReminderHouseholdMembersResponseImplCopyWith<$Res>
    implements $ReminderHouseholdMembersResponseCopyWith<$Res> {
  factory _$$ReminderHouseholdMembersResponseImplCopyWith(
          _$ReminderHouseholdMembersResponseImpl value,
          $Res Function(_$ReminderHouseholdMembersResponseImpl) then) =
      __$$ReminderHouseholdMembersResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? status, String? message, int? code, ReminderHouseholdData? data});

  @override
  $ReminderHouseholdDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ReminderHouseholdMembersResponseImplCopyWithImpl<$Res>
    extends _$ReminderHouseholdMembersResponseCopyWithImpl<$Res,
        _$ReminderHouseholdMembersResponseImpl>
    implements _$$ReminderHouseholdMembersResponseImplCopyWith<$Res> {
  __$$ReminderHouseholdMembersResponseImplCopyWithImpl(
      _$ReminderHouseholdMembersResponseImpl _value,
      $Res Function(_$ReminderHouseholdMembersResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReminderHouseholdMembersResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ReminderHouseholdMembersResponseImpl(
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
              as ReminderHouseholdData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$ReminderHouseholdMembersResponseImpl
    implements _ReminderHouseholdMembersResponse {
  const _$ReminderHouseholdMembersResponseImpl(
      {this.status, this.message, this.code, this.data});

  factory _$ReminderHouseholdMembersResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ReminderHouseholdMembersResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final ReminderHouseholdData? data;

  @override
  String toString() {
    return 'ReminderHouseholdMembersResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReminderHouseholdMembersResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of ReminderHouseholdMembersResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReminderHouseholdMembersResponseImplCopyWith<
          _$ReminderHouseholdMembersResponseImpl>
      get copyWith => __$$ReminderHouseholdMembersResponseImplCopyWithImpl<
          _$ReminderHouseholdMembersResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReminderHouseholdMembersResponseImplToJson(
      this,
    );
  }
}

abstract class _ReminderHouseholdMembersResponse
    implements ReminderHouseholdMembersResponse {
  const factory _ReminderHouseholdMembersResponse(
          {final bool? status,
          final String? message,
          final int? code,
          final ReminderHouseholdData? data}) =
      _$ReminderHouseholdMembersResponseImpl;

  factory _ReminderHouseholdMembersResponse.fromJson(
          Map<String, dynamic> json) =
      _$ReminderHouseholdMembersResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  ReminderHouseholdData? get data;

  /// Create a copy of ReminderHouseholdMembersResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReminderHouseholdMembersResponseImplCopyWith<
          _$ReminderHouseholdMembersResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
