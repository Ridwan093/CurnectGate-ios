// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'violation_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ViolationData _$ViolationDataFromJson(Map<String, dynamic> json) {
  return _ViolationData.fromJson(json);
}

/// @nodoc
mixin _$ViolationData {
  List<Violation> get violations => throw _privateConstructorUsedError;

  /// Serializes this ViolationData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ViolationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ViolationDataCopyWith<ViolationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViolationDataCopyWith<$Res> {
  factory $ViolationDataCopyWith(
          ViolationData value, $Res Function(ViolationData) then) =
      _$ViolationDataCopyWithImpl<$Res, ViolationData>;
  @useResult
  $Res call({List<Violation> violations});
}

/// @nodoc
class _$ViolationDataCopyWithImpl<$Res, $Val extends ViolationData>
    implements $ViolationDataCopyWith<$Res> {
  _$ViolationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ViolationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? violations = null,
  }) {
    return _then(_value.copyWith(
      violations: null == violations
          ? _value.violations
          : violations // ignore: cast_nullable_to_non_nullable
              as List<Violation>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ViolationDataImplCopyWith<$Res>
    implements $ViolationDataCopyWith<$Res> {
  factory _$$ViolationDataImplCopyWith(
          _$ViolationDataImpl value, $Res Function(_$ViolationDataImpl) then) =
      __$$ViolationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Violation> violations});
}

/// @nodoc
class __$$ViolationDataImplCopyWithImpl<$Res>
    extends _$ViolationDataCopyWithImpl<$Res, _$ViolationDataImpl>
    implements _$$ViolationDataImplCopyWith<$Res> {
  __$$ViolationDataImplCopyWithImpl(
      _$ViolationDataImpl _value, $Res Function(_$ViolationDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ViolationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? violations = null,
  }) {
    return _then(_$ViolationDataImpl(
      violations: null == violations
          ? _value._violations
          : violations // ignore: cast_nullable_to_non_nullable
              as List<Violation>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ViolationDataImpl implements _ViolationData {
  const _$ViolationDataImpl({required final List<Violation> violations})
      : _violations = violations;

  factory _$ViolationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ViolationDataImplFromJson(json);

  final List<Violation> _violations;
  @override
  List<Violation> get violations {
    if (_violations is EqualUnmodifiableListView) return _violations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_violations);
  }

  @override
  String toString() {
    return 'ViolationData(violations: $violations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViolationDataImpl &&
            const DeepCollectionEquality()
                .equals(other._violations, _violations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_violations));

  /// Create a copy of ViolationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ViolationDataImplCopyWith<_$ViolationDataImpl> get copyWith =>
      __$$ViolationDataImplCopyWithImpl<_$ViolationDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ViolationDataImplToJson(
      this,
    );
  }
}

abstract class _ViolationData implements ViolationData {
  const factory _ViolationData({required final List<Violation> violations}) =
      _$ViolationDataImpl;

  factory _ViolationData.fromJson(Map<String, dynamic> json) =
      _$ViolationDataImpl.fromJson;

  @override
  List<Violation> get violations;

  /// Create a copy of ViolationData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViolationDataImplCopyWith<_$ViolationDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
