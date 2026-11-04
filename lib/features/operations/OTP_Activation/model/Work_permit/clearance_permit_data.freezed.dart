// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clearance_permit_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClearancePermitData _$ClearancePermitDataFromJson(Map<String, dynamic> json) {
  return _ClearancePermitData.fromJson(json);
}

/// @nodoc
mixin _$ClearancePermitData {
  List<Permit>? get permits => throw _privateConstructorUsedError;

  /// Serializes this ClearancePermitData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClearancePermitData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClearancePermitDataCopyWith<ClearancePermitData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClearancePermitDataCopyWith<$Res> {
  factory $ClearancePermitDataCopyWith(
          ClearancePermitData value, $Res Function(ClearancePermitData) then) =
      _$ClearancePermitDataCopyWithImpl<$Res, ClearancePermitData>;
  @useResult
  $Res call({List<Permit>? permits});
}

/// @nodoc
class _$ClearancePermitDataCopyWithImpl<$Res, $Val extends ClearancePermitData>
    implements $ClearancePermitDataCopyWith<$Res> {
  _$ClearancePermitDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClearancePermitData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permits = freezed,
  }) {
    return _then(_value.copyWith(
      permits: freezed == permits
          ? _value.permits
          : permits // ignore: cast_nullable_to_non_nullable
              as List<Permit>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClearancePermitDataImplCopyWith<$Res>
    implements $ClearancePermitDataCopyWith<$Res> {
  factory _$$ClearancePermitDataImplCopyWith(_$ClearancePermitDataImpl value,
          $Res Function(_$ClearancePermitDataImpl) then) =
      __$$ClearancePermitDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Permit>? permits});
}

/// @nodoc
class __$$ClearancePermitDataImplCopyWithImpl<$Res>
    extends _$ClearancePermitDataCopyWithImpl<$Res, _$ClearancePermitDataImpl>
    implements _$$ClearancePermitDataImplCopyWith<$Res> {
  __$$ClearancePermitDataImplCopyWithImpl(_$ClearancePermitDataImpl _value,
      $Res Function(_$ClearancePermitDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClearancePermitData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permits = freezed,
  }) {
    return _then(_$ClearancePermitDataImpl(
      permits: freezed == permits
          ? _value._permits
          : permits // ignore: cast_nullable_to_non_nullable
              as List<Permit>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$ClearancePermitDataImpl implements _ClearancePermitData {
  const _$ClearancePermitDataImpl({final List<Permit>? permits})
      : _permits = permits;

  factory _$ClearancePermitDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClearancePermitDataImplFromJson(json);

  final List<Permit>? _permits;
  @override
  List<Permit>? get permits {
    final value = _permits;
    if (value == null) return null;
    if (_permits is EqualUnmodifiableListView) return _permits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ClearancePermitData(permits: $permits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClearancePermitDataImpl &&
            const DeepCollectionEquality().equals(other._permits, _permits));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_permits));

  /// Create a copy of ClearancePermitData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClearancePermitDataImplCopyWith<_$ClearancePermitDataImpl> get copyWith =>
      __$$ClearancePermitDataImplCopyWithImpl<_$ClearancePermitDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClearancePermitDataImplToJson(
      this,
    );
  }
}

abstract class _ClearancePermitData implements ClearancePermitData {
  const factory _ClearancePermitData({final List<Permit>? permits}) =
      _$ClearancePermitDataImpl;

  factory _ClearancePermitData.fromJson(Map<String, dynamic> json) =
      _$ClearancePermitDataImpl.fromJson;

  @override
  List<Permit>? get permits;

  /// Create a copy of ClearancePermitData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClearancePermitDataImplCopyWith<_$ClearancePermitDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
