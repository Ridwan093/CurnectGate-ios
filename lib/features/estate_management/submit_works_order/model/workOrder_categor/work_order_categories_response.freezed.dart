// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_order_categories_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkOrderCategoriesResponse _$WorkOrderCategoriesResponseFromJson(
    Map<String, dynamic> json) {
  return _WorkOrderCategoriesResponse.fromJson(json);
}

/// @nodoc
mixin _$WorkOrderCategoriesResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  WorkOrderCategoryData? get data => throw _privateConstructorUsedError;

  /// Serializes this WorkOrderCategoriesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkOrderCategoriesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkOrderCategoriesResponseCopyWith<WorkOrderCategoriesResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkOrderCategoriesResponseCopyWith<$Res> {
  factory $WorkOrderCategoriesResponseCopyWith(
          WorkOrderCategoriesResponse value,
          $Res Function(WorkOrderCategoriesResponse) then) =
      _$WorkOrderCategoriesResponseCopyWithImpl<$Res,
          WorkOrderCategoriesResponse>;
  @useResult
  $Res call(
      {bool? status, String? message, int? code, WorkOrderCategoryData? data});

  $WorkOrderCategoryDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$WorkOrderCategoriesResponseCopyWithImpl<$Res,
        $Val extends WorkOrderCategoriesResponse>
    implements $WorkOrderCategoriesResponseCopyWith<$Res> {
  _$WorkOrderCategoriesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkOrderCategoriesResponse
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
              as WorkOrderCategoryData?,
    ) as $Val);
  }

  /// Create a copy of WorkOrderCategoriesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkOrderCategoryDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $WorkOrderCategoryDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WorkOrderCategoriesResponseImplCopyWith<$Res>
    implements $WorkOrderCategoriesResponseCopyWith<$Res> {
  factory _$$WorkOrderCategoriesResponseImplCopyWith(
          _$WorkOrderCategoriesResponseImpl value,
          $Res Function(_$WorkOrderCategoriesResponseImpl) then) =
      __$$WorkOrderCategoriesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? status, String? message, int? code, WorkOrderCategoryData? data});

  @override
  $WorkOrderCategoryDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$WorkOrderCategoriesResponseImplCopyWithImpl<$Res>
    extends _$WorkOrderCategoriesResponseCopyWithImpl<$Res,
        _$WorkOrderCategoriesResponseImpl>
    implements _$$WorkOrderCategoriesResponseImplCopyWith<$Res> {
  __$$WorkOrderCategoriesResponseImplCopyWithImpl(
      _$WorkOrderCategoriesResponseImpl _value,
      $Res Function(_$WorkOrderCategoriesResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkOrderCategoriesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$WorkOrderCategoriesResponseImpl(
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
              as WorkOrderCategoryData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$WorkOrderCategoriesResponseImpl
    implements _WorkOrderCategoriesResponse {
  const _$WorkOrderCategoriesResponseImpl(
      {this.status, this.message, this.code, this.data});

  factory _$WorkOrderCategoriesResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$WorkOrderCategoriesResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final WorkOrderCategoryData? data;

  @override
  String toString() {
    return 'WorkOrderCategoriesResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkOrderCategoriesResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of WorkOrderCategoriesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkOrderCategoriesResponseImplCopyWith<_$WorkOrderCategoriesResponseImpl>
      get copyWith => __$$WorkOrderCategoriesResponseImplCopyWithImpl<
          _$WorkOrderCategoriesResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkOrderCategoriesResponseImplToJson(
      this,
    );
  }
}

abstract class _WorkOrderCategoriesResponse
    implements WorkOrderCategoriesResponse {
  const factory _WorkOrderCategoriesResponse(
      {final bool? status,
      final String? message,
      final int? code,
      final WorkOrderCategoryData? data}) = _$WorkOrderCategoriesResponseImpl;

  factory _WorkOrderCategoriesResponse.fromJson(Map<String, dynamic> json) =
      _$WorkOrderCategoriesResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  WorkOrderCategoryData? get data;

  /// Create a copy of WorkOrderCategoriesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkOrderCategoriesResponseImplCopyWith<_$WorkOrderCategoriesResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
