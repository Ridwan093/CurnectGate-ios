// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restriction_status_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RestrictionStatusData _$RestrictionStatusDataFromJson(
    Map<String, dynamic> json) {
  return _RestrictionStatusData.fromJson(json);
}

/// @nodoc
mixin _$RestrictionStatusData {
  int? get memberId => throw _privateConstructorUsedError;
  bool? get isRestricted => throw _privateConstructorUsedError;
  bool? get hasDigitalId => throw _privateConstructorUsedError;
  String? get digitalIdStatus => throw _privateConstructorUsedError;
  dynamic get restrictions => throw _privateConstructorUsedError;

  /// Serializes this RestrictionStatusData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RestrictionStatusData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestrictionStatusDataCopyWith<RestrictionStatusData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestrictionStatusDataCopyWith<$Res> {
  factory $RestrictionStatusDataCopyWith(RestrictionStatusData value,
          $Res Function(RestrictionStatusData) then) =
      _$RestrictionStatusDataCopyWithImpl<$Res, RestrictionStatusData>;
  @useResult
  $Res call(
      {int? memberId,
      bool? isRestricted,
      bool? hasDigitalId,
      String? digitalIdStatus,
      dynamic restrictions});
}

/// @nodoc
class _$RestrictionStatusDataCopyWithImpl<$Res,
        $Val extends RestrictionStatusData>
    implements $RestrictionStatusDataCopyWith<$Res> {
  _$RestrictionStatusDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestrictionStatusData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberId = freezed,
    Object? isRestricted = freezed,
    Object? hasDigitalId = freezed,
    Object? digitalIdStatus = freezed,
    Object? restrictions = freezed,
  }) {
    return _then(_value.copyWith(
      memberId: freezed == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as int?,
      isRestricted: freezed == isRestricted
          ? _value.isRestricted
          : isRestricted // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasDigitalId: freezed == hasDigitalId
          ? _value.hasDigitalId
          : hasDigitalId // ignore: cast_nullable_to_non_nullable
              as bool?,
      digitalIdStatus: freezed == digitalIdStatus
          ? _value.digitalIdStatus
          : digitalIdStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      restrictions: freezed == restrictions
          ? _value.restrictions
          : restrictions // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestrictionStatusDataImplCopyWith<$Res>
    implements $RestrictionStatusDataCopyWith<$Res> {
  factory _$$RestrictionStatusDataImplCopyWith(
          _$RestrictionStatusDataImpl value,
          $Res Function(_$RestrictionStatusDataImpl) then) =
      __$$RestrictionStatusDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? memberId,
      bool? isRestricted,
      bool? hasDigitalId,
      String? digitalIdStatus,
      dynamic restrictions});
}

/// @nodoc
class __$$RestrictionStatusDataImplCopyWithImpl<$Res>
    extends _$RestrictionStatusDataCopyWithImpl<$Res,
        _$RestrictionStatusDataImpl>
    implements _$$RestrictionStatusDataImplCopyWith<$Res> {
  __$$RestrictionStatusDataImplCopyWithImpl(_$RestrictionStatusDataImpl _value,
      $Res Function(_$RestrictionStatusDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of RestrictionStatusData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberId = freezed,
    Object? isRestricted = freezed,
    Object? hasDigitalId = freezed,
    Object? digitalIdStatus = freezed,
    Object? restrictions = freezed,
  }) {
    return _then(_$RestrictionStatusDataImpl(
      memberId: freezed == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as int?,
      isRestricted: freezed == isRestricted
          ? _value.isRestricted
          : isRestricted // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasDigitalId: freezed == hasDigitalId
          ? _value.hasDigitalId
          : hasDigitalId // ignore: cast_nullable_to_non_nullable
              as bool?,
      digitalIdStatus: freezed == digitalIdStatus
          ? _value.digitalIdStatus
          : digitalIdStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      restrictions: freezed == restrictions
          ? _value.restrictions
          : restrictions // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$RestrictionStatusDataImpl implements _RestrictionStatusData {
  const _$RestrictionStatusDataImpl(
      {this.memberId,
      this.isRestricted,
      this.hasDigitalId,
      this.digitalIdStatus,
      this.restrictions});

  factory _$RestrictionStatusDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestrictionStatusDataImplFromJson(json);

  @override
  final int? memberId;
  @override
  final bool? isRestricted;
  @override
  final bool? hasDigitalId;
  @override
  final String? digitalIdStatus;
  @override
  final dynamic restrictions;

  @override
  String toString() {
    return 'RestrictionStatusData(memberId: $memberId, isRestricted: $isRestricted, hasDigitalId: $hasDigitalId, digitalIdStatus: $digitalIdStatus, restrictions: $restrictions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestrictionStatusDataImpl &&
            (identical(other.memberId, memberId) ||
                other.memberId == memberId) &&
            (identical(other.isRestricted, isRestricted) ||
                other.isRestricted == isRestricted) &&
            (identical(other.hasDigitalId, hasDigitalId) ||
                other.hasDigitalId == hasDigitalId) &&
            (identical(other.digitalIdStatus, digitalIdStatus) ||
                other.digitalIdStatus == digitalIdStatus) &&
            const DeepCollectionEquality()
                .equals(other.restrictions, restrictions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      memberId,
      isRestricted,
      hasDigitalId,
      digitalIdStatus,
      const DeepCollectionEquality().hash(restrictions));

  /// Create a copy of RestrictionStatusData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestrictionStatusDataImplCopyWith<_$RestrictionStatusDataImpl>
      get copyWith => __$$RestrictionStatusDataImplCopyWithImpl<
          _$RestrictionStatusDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestrictionStatusDataImplToJson(
      this,
    );
  }
}

abstract class _RestrictionStatusData implements RestrictionStatusData {
  const factory _RestrictionStatusData(
      {final int? memberId,
      final bool? isRestricted,
      final bool? hasDigitalId,
      final String? digitalIdStatus,
      final dynamic restrictions}) = _$RestrictionStatusDataImpl;

  factory _RestrictionStatusData.fromJson(Map<String, dynamic> json) =
      _$RestrictionStatusDataImpl.fromJson;

  @override
  int? get memberId;
  @override
  bool? get isRestricted;
  @override
  bool? get hasDigitalId;
  @override
  String? get digitalIdStatus;
  @override
  dynamic get restrictions;

  /// Create a copy of RestrictionStatusData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestrictionStatusDataImplCopyWith<_$RestrictionStatusDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
