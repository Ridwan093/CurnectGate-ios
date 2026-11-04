// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_history_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CheckoutHistoryResponseModel _$CheckoutHistoryResponseModelFromJson(
    Map<String, dynamic> json) {
  return _CheckoutHistoryResponseModel.fromJson(json);
}

/// @nodoc
mixin _$CheckoutHistoryResponseModel {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  CheckoutHistoryData? get data => throw _privateConstructorUsedError;

  /// Serializes this CheckoutHistoryResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckoutHistoryResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckoutHistoryResponseModelCopyWith<CheckoutHistoryResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutHistoryResponseModelCopyWith<$Res> {
  factory $CheckoutHistoryResponseModelCopyWith(
          CheckoutHistoryResponseModel value,
          $Res Function(CheckoutHistoryResponseModel) then) =
      _$CheckoutHistoryResponseModelCopyWithImpl<$Res,
          CheckoutHistoryResponseModel>;
  @useResult
  $Res call(
      {bool? status, String? message, int? code, CheckoutHistoryData? data});

  $CheckoutHistoryDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$CheckoutHistoryResponseModelCopyWithImpl<$Res,
        $Val extends CheckoutHistoryResponseModel>
    implements $CheckoutHistoryResponseModelCopyWith<$Res> {
  _$CheckoutHistoryResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckoutHistoryResponseModel
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
              as CheckoutHistoryData?,
    ) as $Val);
  }

  /// Create a copy of CheckoutHistoryResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CheckoutHistoryDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $CheckoutHistoryDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CheckoutHistoryResponseModelImplCopyWith<$Res>
    implements $CheckoutHistoryResponseModelCopyWith<$Res> {
  factory _$$CheckoutHistoryResponseModelImplCopyWith(
          _$CheckoutHistoryResponseModelImpl value,
          $Res Function(_$CheckoutHistoryResponseModelImpl) then) =
      __$$CheckoutHistoryResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? status, String? message, int? code, CheckoutHistoryData? data});

  @override
  $CheckoutHistoryDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$CheckoutHistoryResponseModelImplCopyWithImpl<$Res>
    extends _$CheckoutHistoryResponseModelCopyWithImpl<$Res,
        _$CheckoutHistoryResponseModelImpl>
    implements _$$CheckoutHistoryResponseModelImplCopyWith<$Res> {
  __$$CheckoutHistoryResponseModelImplCopyWithImpl(
      _$CheckoutHistoryResponseModelImpl _value,
      $Res Function(_$CheckoutHistoryResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckoutHistoryResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$CheckoutHistoryResponseModelImpl(
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
              as CheckoutHistoryData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$CheckoutHistoryResponseModelImpl
    implements _CheckoutHistoryResponseModel {
  const _$CheckoutHistoryResponseModelImpl(
      {this.status, this.message, this.code, this.data});

  factory _$CheckoutHistoryResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CheckoutHistoryResponseModelImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final CheckoutHistoryData? data;

  @override
  String toString() {
    return 'CheckoutHistoryResponseModel(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutHistoryResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of CheckoutHistoryResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutHistoryResponseModelImplCopyWith<
          _$CheckoutHistoryResponseModelImpl>
      get copyWith => __$$CheckoutHistoryResponseModelImplCopyWithImpl<
          _$CheckoutHistoryResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckoutHistoryResponseModelImplToJson(
      this,
    );
  }
}

abstract class _CheckoutHistoryResponseModel
    implements CheckoutHistoryResponseModel {
  const factory _CheckoutHistoryResponseModel(
      {final bool? status,
      final String? message,
      final int? code,
      final CheckoutHistoryData? data}) = _$CheckoutHistoryResponseModelImpl;

  factory _CheckoutHistoryResponseModel.fromJson(Map<String, dynamic> json) =
      _$CheckoutHistoryResponseModelImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  CheckoutHistoryData? get data;

  /// Create a copy of CheckoutHistoryResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutHistoryResponseModelImplCopyWith<
          _$CheckoutHistoryResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
