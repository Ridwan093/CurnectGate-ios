// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_orders_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkOrderResponse _$WorkOrderResponseFromJson(Map<String, dynamic> json) {
  return _WorkOrderResponse.fromJson(json);
}

/// @nodoc
mixin _$WorkOrderResponse {
  bool get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  WorkOrderData get data => throw _privateConstructorUsedError;

  /// Serializes this WorkOrderResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkOrderResponseCopyWith<WorkOrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkOrderResponseCopyWith<$Res> {
  factory $WorkOrderResponseCopyWith(
          WorkOrderResponse value, $Res Function(WorkOrderResponse) then) =
      _$WorkOrderResponseCopyWithImpl<$Res, WorkOrderResponse>;
  @useResult
  $Res call({bool status, String message, int code, WorkOrderData data});

  $WorkOrderDataCopyWith<$Res> get data;
}

/// @nodoc
class _$WorkOrderResponseCopyWithImpl<$Res, $Val extends WorkOrderResponse>
    implements $WorkOrderResponseCopyWith<$Res> {
  _$WorkOrderResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkOrderResponse
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
              as WorkOrderData,
    ) as $Val);
  }

  /// Create a copy of WorkOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkOrderDataCopyWith<$Res> get data {
    return $WorkOrderDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WorkOrderResponseImplCopyWith<$Res>
    implements $WorkOrderResponseCopyWith<$Res> {
  factory _$$WorkOrderResponseImplCopyWith(_$WorkOrderResponseImpl value,
          $Res Function(_$WorkOrderResponseImpl) then) =
      __$$WorkOrderResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool status, String message, int code, WorkOrderData data});

  @override
  $WorkOrderDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$WorkOrderResponseImplCopyWithImpl<$Res>
    extends _$WorkOrderResponseCopyWithImpl<$Res, _$WorkOrderResponseImpl>
    implements _$$WorkOrderResponseImplCopyWith<$Res> {
  __$$WorkOrderResponseImplCopyWithImpl(_$WorkOrderResponseImpl _value,
      $Res Function(_$WorkOrderResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? code = null,
    Object? data = null,
  }) {
    return _then(_$WorkOrderResponseImpl(
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
              as WorkOrderData,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$WorkOrderResponseImpl implements _WorkOrderResponse {
  const _$WorkOrderResponseImpl(
      {required this.status,
      required this.message,
      required this.code,
      required this.data});

  factory _$WorkOrderResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkOrderResponseImplFromJson(json);

  @override
  final bool status;
  @override
  final String message;
  @override
  final int code;
  @override
  final WorkOrderData data;

  @override
  String toString() {
    return 'WorkOrderResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkOrderResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of WorkOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkOrderResponseImplCopyWith<_$WorkOrderResponseImpl> get copyWith =>
      __$$WorkOrderResponseImplCopyWithImpl<_$WorkOrderResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkOrderResponseImplToJson(
      this,
    );
  }
}

abstract class _WorkOrderResponse implements WorkOrderResponse {
  const factory _WorkOrderResponse(
      {required final bool status,
      required final String message,
      required final int code,
      required final WorkOrderData data}) = _$WorkOrderResponseImpl;

  factory _WorkOrderResponse.fromJson(Map<String, dynamic> json) =
      _$WorkOrderResponseImpl.fromJson;

  @override
  bool get status;
  @override
  String get message;
  @override
  int get code;
  @override
  WorkOrderData get data;

  /// Create a copy of WorkOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkOrderResponseImplCopyWith<_$WorkOrderResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
