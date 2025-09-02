// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'committees_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommitteesResponse _$CommitteesResponseFromJson(Map<String, dynamic> json) {
  return _CommitteesResponse.fromJson(json);
}

/// @nodoc
mixin _$CommitteesResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  CommitteesData? get data => throw _privateConstructorUsedError;

  /// Serializes this CommitteesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommitteesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommitteesResponseCopyWith<CommitteesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommitteesResponseCopyWith<$Res> {
  factory $CommitteesResponseCopyWith(
          CommitteesResponse value, $Res Function(CommitteesResponse) then) =
      _$CommitteesResponseCopyWithImpl<$Res, CommitteesResponse>;
  @useResult
  $Res call({bool? status, String? message, int? code, CommitteesData? data});

  $CommitteesDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$CommitteesResponseCopyWithImpl<$Res, $Val extends CommitteesResponse>
    implements $CommitteesResponseCopyWith<$Res> {
  _$CommitteesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommitteesResponse
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
              as CommitteesData?,
    ) as $Val);
  }

  /// Create a copy of CommitteesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommitteesDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $CommitteesDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommitteesResponseImplCopyWith<$Res>
    implements $CommitteesResponseCopyWith<$Res> {
  factory _$$CommitteesResponseImplCopyWith(_$CommitteesResponseImpl value,
          $Res Function(_$CommitteesResponseImpl) then) =
      __$$CommitteesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, String? message, int? code, CommitteesData? data});

  @override
  $CommitteesDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$CommitteesResponseImplCopyWithImpl<$Res>
    extends _$CommitteesResponseCopyWithImpl<$Res, _$CommitteesResponseImpl>
    implements _$$CommitteesResponseImplCopyWith<$Res> {
  __$$CommitteesResponseImplCopyWithImpl(_$CommitteesResponseImpl _value,
      $Res Function(_$CommitteesResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommitteesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$CommitteesResponseImpl(
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
              as CommitteesData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$CommitteesResponseImpl implements _CommitteesResponse {
  const _$CommitteesResponseImpl(
      {this.status, this.message, this.code, this.data});

  factory _$CommitteesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommitteesResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final CommitteesData? data;

  @override
  String toString() {
    return 'CommitteesResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommitteesResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of CommitteesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommitteesResponseImplCopyWith<_$CommitteesResponseImpl> get copyWith =>
      __$$CommitteesResponseImplCopyWithImpl<_$CommitteesResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommitteesResponseImplToJson(
      this,
    );
  }
}

abstract class _CommitteesResponse implements CommitteesResponse {
  const factory _CommitteesResponse(
      {final bool? status,
      final String? message,
      final int? code,
      final CommitteesData? data}) = _$CommitteesResponseImpl;

  factory _CommitteesResponse.fromJson(Map<String, dynamic> json) =
      _$CommitteesResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  CommitteesData? get data;

  /// Create a copy of CommitteesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommitteesResponseImplCopyWith<_$CommitteesResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommitteesData _$CommitteesDataFromJson(Map<String, dynamic> json) {
  return _CommitteesData.fromJson(json);
}

/// @nodoc
mixin _$CommitteesData {
  CommitteeList? get committees => throw _privateConstructorUsedError;

  /// Serializes this CommitteesData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommitteesData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommitteesDataCopyWith<CommitteesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommitteesDataCopyWith<$Res> {
  factory $CommitteesDataCopyWith(
          CommitteesData value, $Res Function(CommitteesData) then) =
      _$CommitteesDataCopyWithImpl<$Res, CommitteesData>;
  @useResult
  $Res call({CommitteeList? committees});

  $CommitteeListCopyWith<$Res>? get committees;
}

/// @nodoc
class _$CommitteesDataCopyWithImpl<$Res, $Val extends CommitteesData>
    implements $CommitteesDataCopyWith<$Res> {
  _$CommitteesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommitteesData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? committees = freezed,
  }) {
    return _then(_value.copyWith(
      committees: freezed == committees
          ? _value.committees
          : committees // ignore: cast_nullable_to_non_nullable
              as CommitteeList?,
    ) as $Val);
  }

  /// Create a copy of CommitteesData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommitteeListCopyWith<$Res>? get committees {
    if (_value.committees == null) {
      return null;
    }

    return $CommitteeListCopyWith<$Res>(_value.committees!, (value) {
      return _then(_value.copyWith(committees: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommitteesDataImplCopyWith<$Res>
    implements $CommitteesDataCopyWith<$Res> {
  factory _$$CommitteesDataImplCopyWith(_$CommitteesDataImpl value,
          $Res Function(_$CommitteesDataImpl) then) =
      __$$CommitteesDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CommitteeList? committees});

  @override
  $CommitteeListCopyWith<$Res>? get committees;
}

/// @nodoc
class __$$CommitteesDataImplCopyWithImpl<$Res>
    extends _$CommitteesDataCopyWithImpl<$Res, _$CommitteesDataImpl>
    implements _$$CommitteesDataImplCopyWith<$Res> {
  __$$CommitteesDataImplCopyWithImpl(
      _$CommitteesDataImpl _value, $Res Function(_$CommitteesDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommitteesData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? committees = freezed,
  }) {
    return _then(_$CommitteesDataImpl(
      committees: freezed == committees
          ? _value.committees
          : committees // ignore: cast_nullable_to_non_nullable
              as CommitteeList?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$CommitteesDataImpl implements _CommitteesData {
  const _$CommitteesDataImpl({this.committees});

  factory _$CommitteesDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommitteesDataImplFromJson(json);

  @override
  final CommitteeList? committees;

  @override
  String toString() {
    return 'CommitteesData(committees: $committees)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommitteesDataImpl &&
            (identical(other.committees, committees) ||
                other.committees == committees));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, committees);

  /// Create a copy of CommitteesData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommitteesDataImplCopyWith<_$CommitteesDataImpl> get copyWith =>
      __$$CommitteesDataImplCopyWithImpl<_$CommitteesDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommitteesDataImplToJson(
      this,
    );
  }
}

abstract class _CommitteesData implements CommitteesData {
  const factory _CommitteesData({final CommitteeList? committees}) =
      _$CommitteesDataImpl;

  factory _CommitteesData.fromJson(Map<String, dynamic> json) =
      _$CommitteesDataImpl.fromJson;

  @override
  CommitteeList? get committees;

  /// Create a copy of CommitteesData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommitteesDataImplCopyWith<_$CommitteesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
