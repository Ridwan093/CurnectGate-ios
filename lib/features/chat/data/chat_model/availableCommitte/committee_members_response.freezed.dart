// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'committee_members_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommitteeMembersResponse _$CommitteeMembersResponseFromJson(
    Map<String, dynamic> json) {
  return _CommitteeMembersResponse.fromJson(json);
}

/// @nodoc
mixin _$CommitteeMembersResponse {
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  CommitteeMembersData? get data => throw _privateConstructorUsedError;

  /// Serializes this CommitteeMembersResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommitteeMembersResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommitteeMembersResponseCopyWith<CommitteeMembersResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommitteeMembersResponseCopyWith<$Res> {
  factory $CommitteeMembersResponseCopyWith(CommitteeMembersResponse value,
          $Res Function(CommitteeMembersResponse) then) =
      _$CommitteeMembersResponseCopyWithImpl<$Res, CommitteeMembersResponse>;
  @useResult
  $Res call({bool? success, String? message, CommitteeMembersData? data});

  $CommitteeMembersDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$CommitteeMembersResponseCopyWithImpl<$Res,
        $Val extends CommitteeMembersResponse>
    implements $CommitteeMembersResponseCopyWith<$Res> {
  _$CommitteeMembersResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommitteeMembersResponse
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
              as CommitteeMembersData?,
    ) as $Val);
  }

  /// Create a copy of CommitteeMembersResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommitteeMembersDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $CommitteeMembersDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommitteeMembersResponseImplCopyWith<$Res>
    implements $CommitteeMembersResponseCopyWith<$Res> {
  factory _$$CommitteeMembersResponseImplCopyWith(
          _$CommitteeMembersResponseImpl value,
          $Res Function(_$CommitteeMembersResponseImpl) then) =
      __$$CommitteeMembersResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, String? message, CommitteeMembersData? data});

  @override
  $CommitteeMembersDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$CommitteeMembersResponseImplCopyWithImpl<$Res>
    extends _$CommitteeMembersResponseCopyWithImpl<$Res,
        _$CommitteeMembersResponseImpl>
    implements _$$CommitteeMembersResponseImplCopyWith<$Res> {
  __$$CommitteeMembersResponseImplCopyWithImpl(
      _$CommitteeMembersResponseImpl _value,
      $Res Function(_$CommitteeMembersResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommitteeMembersResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$CommitteeMembersResponseImpl(
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
              as CommitteeMembersData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$CommitteeMembersResponseImpl implements _CommitteeMembersResponse {
  const _$CommitteeMembersResponseImpl({this.success, this.message, this.data});

  factory _$CommitteeMembersResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommitteeMembersResponseImplFromJson(json);

  @override
  final bool? success;
  @override
  final String? message;
  @override
  final CommitteeMembersData? data;

  @override
  String toString() {
    return 'CommitteeMembersResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommitteeMembersResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of CommitteeMembersResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommitteeMembersResponseImplCopyWith<_$CommitteeMembersResponseImpl>
      get copyWith => __$$CommitteeMembersResponseImplCopyWithImpl<
          _$CommitteeMembersResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommitteeMembersResponseImplToJson(
      this,
    );
  }
}

abstract class _CommitteeMembersResponse implements CommitteeMembersResponse {
  const factory _CommitteeMembersResponse(
      {final bool? success,
      final String? message,
      final CommitteeMembersData? data}) = _$CommitteeMembersResponseImpl;

  factory _CommitteeMembersResponse.fromJson(Map<String, dynamic> json) =
      _$CommitteeMembersResponseImpl.fromJson;

  @override
  bool? get success;
  @override
  String? get message;
  @override
  CommitteeMembersData? get data;

  /// Create a copy of CommitteeMembersResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommitteeMembersResponseImplCopyWith<_$CommitteeMembersResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
