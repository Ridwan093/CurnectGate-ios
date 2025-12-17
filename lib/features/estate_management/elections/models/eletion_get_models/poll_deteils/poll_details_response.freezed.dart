// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poll_details_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PollDetailsResponse _$PollDetailsResponseFromJson(Map<String, dynamic> json) {
  return _PollDetailsResponse.fromJson(json);
}

/// @nodoc
mixin _$PollDetailsResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  PollDetailsData? get data => throw _privateConstructorUsedError;

  /// Serializes this PollDetailsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PollDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PollDetailsResponseCopyWith<PollDetailsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollDetailsResponseCopyWith<$Res> {
  factory $PollDetailsResponseCopyWith(
          PollDetailsResponse value, $Res Function(PollDetailsResponse) then) =
      _$PollDetailsResponseCopyWithImpl<$Res, PollDetailsResponse>;
  @useResult
  $Res call({bool? status, String? message, int? code, PollDetailsData? data});

  $PollDetailsDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$PollDetailsResponseCopyWithImpl<$Res, $Val extends PollDetailsResponse>
    implements $PollDetailsResponseCopyWith<$Res> {
  _$PollDetailsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PollDetailsResponse
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
              as PollDetailsData?,
    ) as $Val);
  }

  /// Create a copy of PollDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PollDetailsDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $PollDetailsDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PollDetailsResponseImplCopyWith<$Res>
    implements $PollDetailsResponseCopyWith<$Res> {
  factory _$$PollDetailsResponseImplCopyWith(_$PollDetailsResponseImpl value,
          $Res Function(_$PollDetailsResponseImpl) then) =
      __$$PollDetailsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, String? message, int? code, PollDetailsData? data});

  @override
  $PollDetailsDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$PollDetailsResponseImplCopyWithImpl<$Res>
    extends _$PollDetailsResponseCopyWithImpl<$Res, _$PollDetailsResponseImpl>
    implements _$$PollDetailsResponseImplCopyWith<$Res> {
  __$$PollDetailsResponseImplCopyWithImpl(_$PollDetailsResponseImpl _value,
      $Res Function(_$PollDetailsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PollDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$PollDetailsResponseImpl(
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
              as PollDetailsData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$PollDetailsResponseImpl implements _PollDetailsResponse {
  const _$PollDetailsResponseImpl(
      {this.status, this.message, this.code, this.data});

  factory _$PollDetailsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PollDetailsResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final PollDetailsData? data;

  @override
  String toString() {
    return 'PollDetailsResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PollDetailsResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of PollDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PollDetailsResponseImplCopyWith<_$PollDetailsResponseImpl> get copyWith =>
      __$$PollDetailsResponseImplCopyWithImpl<_$PollDetailsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PollDetailsResponseImplToJson(
      this,
    );
  }
}

abstract class _PollDetailsResponse implements PollDetailsResponse {
  const factory _PollDetailsResponse(
      {final bool? status,
      final String? message,
      final int? code,
      final PollDetailsData? data}) = _$PollDetailsResponseImpl;

  factory _PollDetailsResponse.fromJson(Map<String, dynamic> json) =
      _$PollDetailsResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  PollDetailsData? get data;

  /// Create a copy of PollDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PollDetailsResponseImplCopyWith<_$PollDetailsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
