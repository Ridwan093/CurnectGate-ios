// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'violation_category_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ViolationCategoryResponse _$ViolationCategoryResponseFromJson(
    Map<String, dynamic> json) {
  return _ViolationCategoryResponse.fromJson(json);
}

/// @nodoc
mixin _$ViolationCategoryResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  CategoryData? get data => throw _privateConstructorUsedError;

  /// Serializes this ViolationCategoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ViolationCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ViolationCategoryResponseCopyWith<ViolationCategoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViolationCategoryResponseCopyWith<$Res> {
  factory $ViolationCategoryResponseCopyWith(ViolationCategoryResponse value,
          $Res Function(ViolationCategoryResponse) then) =
      _$ViolationCategoryResponseCopyWithImpl<$Res, ViolationCategoryResponse>;
  @useResult
  $Res call({bool? status, String? message, int? code, CategoryData? data});

  $CategoryDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ViolationCategoryResponseCopyWithImpl<$Res,
        $Val extends ViolationCategoryResponse>
    implements $ViolationCategoryResponseCopyWith<$Res> {
  _$ViolationCategoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ViolationCategoryResponse
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
              as CategoryData?,
    ) as $Val);
  }

  /// Create a copy of ViolationCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $CategoryDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ViolationCategoryResponseImplCopyWith<$Res>
    implements $ViolationCategoryResponseCopyWith<$Res> {
  factory _$$ViolationCategoryResponseImplCopyWith(
          _$ViolationCategoryResponseImpl value,
          $Res Function(_$ViolationCategoryResponseImpl) then) =
      __$$ViolationCategoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, String? message, int? code, CategoryData? data});

  @override
  $CategoryDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ViolationCategoryResponseImplCopyWithImpl<$Res>
    extends _$ViolationCategoryResponseCopyWithImpl<$Res,
        _$ViolationCategoryResponseImpl>
    implements _$$ViolationCategoryResponseImplCopyWith<$Res> {
  __$$ViolationCategoryResponseImplCopyWithImpl(
      _$ViolationCategoryResponseImpl _value,
      $Res Function(_$ViolationCategoryResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ViolationCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ViolationCategoryResponseImpl(
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
              as CategoryData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ViolationCategoryResponseImpl implements _ViolationCategoryResponse {
  const _$ViolationCategoryResponseImpl(
      {this.status, this.message, this.code, this.data});

  factory _$ViolationCategoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ViolationCategoryResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final CategoryData? data;

  @override
  String toString() {
    return 'ViolationCategoryResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViolationCategoryResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of ViolationCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ViolationCategoryResponseImplCopyWith<_$ViolationCategoryResponseImpl>
      get copyWith => __$$ViolationCategoryResponseImplCopyWithImpl<
          _$ViolationCategoryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ViolationCategoryResponseImplToJson(
      this,
    );
  }
}

abstract class _ViolationCategoryResponse implements ViolationCategoryResponse {
  const factory _ViolationCategoryResponse(
      {final bool? status,
      final String? message,
      final int? code,
      final CategoryData? data}) = _$ViolationCategoryResponseImpl;

  factory _ViolationCategoryResponse.fromJson(Map<String, dynamic> json) =
      _$ViolationCategoryResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  CategoryData? get data;

  /// Create a copy of ViolationCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViolationCategoryResponseImplCopyWith<_$ViolationCategoryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
