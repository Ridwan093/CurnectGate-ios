// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminders_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RemindersResponseModel _$RemindersResponseModelFromJson(
    Map<String, dynamic> json) {
  return _RemindersResponseModel.fromJson(json);
}

/// @nodoc
mixin _$RemindersResponseModel {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  RemindersData? get data => throw _privateConstructorUsedError;

  /// Serializes this RemindersResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RemindersResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RemindersResponseModelCopyWith<RemindersResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemindersResponseModelCopyWith<$Res> {
  factory $RemindersResponseModelCopyWith(RemindersResponseModel value,
          $Res Function(RemindersResponseModel) then) =
      _$RemindersResponseModelCopyWithImpl<$Res, RemindersResponseModel>;
  @useResult
  $Res call({bool? status, String? message, int? code, RemindersData? data});

  $RemindersDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$RemindersResponseModelCopyWithImpl<$Res,
        $Val extends RemindersResponseModel>
    implements $RemindersResponseModelCopyWith<$Res> {
  _$RemindersResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RemindersResponseModel
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
              as RemindersData?,
    ) as $Val);
  }

  /// Create a copy of RemindersResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemindersDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $RemindersDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RemindersResponseModelImplCopyWith<$Res>
    implements $RemindersResponseModelCopyWith<$Res> {
  factory _$$RemindersResponseModelImplCopyWith(
          _$RemindersResponseModelImpl value,
          $Res Function(_$RemindersResponseModelImpl) then) =
      __$$RemindersResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, String? message, int? code, RemindersData? data});

  @override
  $RemindersDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$RemindersResponseModelImplCopyWithImpl<$Res>
    extends _$RemindersResponseModelCopyWithImpl<$Res,
        _$RemindersResponseModelImpl>
    implements _$$RemindersResponseModelImplCopyWith<$Res> {
  __$$RemindersResponseModelImplCopyWithImpl(
      _$RemindersResponseModelImpl _value,
      $Res Function(_$RemindersResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemindersResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$RemindersResponseModelImpl(
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
              as RemindersData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$RemindersResponseModelImpl implements _RemindersResponseModel {
  const _$RemindersResponseModelImpl(
      {this.status, this.message, this.code, this.data});

  factory _$RemindersResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemindersResponseModelImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final RemindersData? data;

  @override
  String toString() {
    return 'RemindersResponseModel(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemindersResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of RemindersResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemindersResponseModelImplCopyWith<_$RemindersResponseModelImpl>
      get copyWith => __$$RemindersResponseModelImplCopyWithImpl<
          _$RemindersResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemindersResponseModelImplToJson(
      this,
    );
  }
}

abstract class _RemindersResponseModel implements RemindersResponseModel {
  const factory _RemindersResponseModel(
      {final bool? status,
      final String? message,
      final int? code,
      final RemindersData? data}) = _$RemindersResponseModelImpl;

  factory _RemindersResponseModel.fromJson(Map<String, dynamic> json) =
      _$RemindersResponseModelImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  RemindersData? get data;

  /// Create a copy of RemindersResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemindersResponseModelImplCopyWith<_$RemindersResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
