// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grant_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GrantDetails _$GrantDetailsFromJson(Map<String, dynamic> json) {
  return _GrantDetails.fromJson(json);
}

/// @nodoc
mixin _$GrantDetails {
  @JsonKey(name: 'granted_by')
  GrantedBy? get grantedBy => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  Map<String, dynamic>? get conditions => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_at')
  String? get expiresAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'granted_at')
  String? get grantedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this GrantDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GrantDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GrantDetailsCopyWith<GrantDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GrantDetailsCopyWith<$Res> {
  factory $GrantDetailsCopyWith(
          GrantDetails value, $Res Function(GrantDetails) then) =
      _$GrantDetailsCopyWithImpl<$Res, GrantDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: 'granted_by') GrantedBy? grantedBy,
      String? reason,
      Map<String, dynamic>? conditions,
      @JsonKey(name: 'expires_at') String? expiresAt,
      @JsonKey(name: 'granted_at') String? grantedAt,
      @JsonKey(name: 'updated_at') String? updatedAt});

  $GrantedByCopyWith<$Res>? get grantedBy;
}

/// @nodoc
class _$GrantDetailsCopyWithImpl<$Res, $Val extends GrantDetails>
    implements $GrantDetailsCopyWith<$Res> {
  _$GrantDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GrantDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? grantedBy = freezed,
    Object? reason = freezed,
    Object? conditions = freezed,
    Object? expiresAt = freezed,
    Object? grantedAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      grantedBy: freezed == grantedBy
          ? _value.grantedBy
          : grantedBy // ignore: cast_nullable_to_non_nullable
              as GrantedBy?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      conditions: freezed == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String?,
      grantedAt: freezed == grantedAt
          ? _value.grantedAt
          : grantedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of GrantDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GrantedByCopyWith<$Res>? get grantedBy {
    if (_value.grantedBy == null) {
      return null;
    }

    return $GrantedByCopyWith<$Res>(_value.grantedBy!, (value) {
      return _then(_value.copyWith(grantedBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GrantDetailsImplCopyWith<$Res>
    implements $GrantDetailsCopyWith<$Res> {
  factory _$$GrantDetailsImplCopyWith(
          _$GrantDetailsImpl value, $Res Function(_$GrantDetailsImpl) then) =
      __$$GrantDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'granted_by') GrantedBy? grantedBy,
      String? reason,
      Map<String, dynamic>? conditions,
      @JsonKey(name: 'expires_at') String? expiresAt,
      @JsonKey(name: 'granted_at') String? grantedAt,
      @JsonKey(name: 'updated_at') String? updatedAt});

  @override
  $GrantedByCopyWith<$Res>? get grantedBy;
}

/// @nodoc
class __$$GrantDetailsImplCopyWithImpl<$Res>
    extends _$GrantDetailsCopyWithImpl<$Res, _$GrantDetailsImpl>
    implements _$$GrantDetailsImplCopyWith<$Res> {
  __$$GrantDetailsImplCopyWithImpl(
      _$GrantDetailsImpl _value, $Res Function(_$GrantDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GrantDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? grantedBy = freezed,
    Object? reason = freezed,
    Object? conditions = freezed,
    Object? expiresAt = freezed,
    Object? grantedAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$GrantDetailsImpl(
      grantedBy: freezed == grantedBy
          ? _value.grantedBy
          : grantedBy // ignore: cast_nullable_to_non_nullable
              as GrantedBy?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      conditions: freezed == conditions
          ? _value._conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String?,
      grantedAt: freezed == grantedAt
          ? _value.grantedAt
          : grantedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GrantDetailsImpl implements _GrantDetails {
  const _$GrantDetailsImpl(
      {@JsonKey(name: 'granted_by') this.grantedBy,
      this.reason,
      final Map<String, dynamic>? conditions,
      @JsonKey(name: 'expires_at') this.expiresAt,
      @JsonKey(name: 'granted_at') this.grantedAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : _conditions = conditions;

  factory _$GrantDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GrantDetailsImplFromJson(json);

  @override
  @JsonKey(name: 'granted_by')
  final GrantedBy? grantedBy;
  @override
  final String? reason;
  final Map<String, dynamic>? _conditions;
  @override
  Map<String, dynamic>? get conditions {
    final value = _conditions;
    if (value == null) return null;
    if (_conditions is EqualUnmodifiableMapView) return _conditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'expires_at')
  final String? expiresAt;
  @override
  @JsonKey(name: 'granted_at')
  final String? grantedAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'GrantDetails(grantedBy: $grantedBy, reason: $reason, conditions: $conditions, expiresAt: $expiresAt, grantedAt: $grantedAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GrantDetailsImpl &&
            (identical(other.grantedBy, grantedBy) ||
                other.grantedBy == grantedBy) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            const DeepCollectionEquality()
                .equals(other._conditions, _conditions) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.grantedAt, grantedAt) ||
                other.grantedAt == grantedAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      grantedBy,
      reason,
      const DeepCollectionEquality().hash(_conditions),
      expiresAt,
      grantedAt,
      updatedAt);

  /// Create a copy of GrantDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GrantDetailsImplCopyWith<_$GrantDetailsImpl> get copyWith =>
      __$$GrantDetailsImplCopyWithImpl<_$GrantDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GrantDetailsImplToJson(
      this,
    );
  }
}

abstract class _GrantDetails implements GrantDetails {
  const factory _GrantDetails(
          {@JsonKey(name: 'granted_by') final GrantedBy? grantedBy,
          final String? reason,
          final Map<String, dynamic>? conditions,
          @JsonKey(name: 'expires_at') final String? expiresAt,
          @JsonKey(name: 'granted_at') final String? grantedAt,
          @JsonKey(name: 'updated_at') final String? updatedAt}) =
      _$GrantDetailsImpl;

  factory _GrantDetails.fromJson(Map<String, dynamic> json) =
      _$GrantDetailsImpl.fromJson;

  @override
  @JsonKey(name: 'granted_by')
  GrantedBy? get grantedBy;
  @override
  String? get reason;
  @override
  Map<String, dynamic>? get conditions;
  @override
  @JsonKey(name: 'expires_at')
  String? get expiresAt;
  @override
  @JsonKey(name: 'granted_at')
  String? get grantedAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of GrantDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GrantDetailsImplCopyWith<_$GrantDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
