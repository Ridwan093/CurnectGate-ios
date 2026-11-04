// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PermissionsData _$PermissionsDataFromJson(Map<String, dynamic> json) {
  return _PermissionsData.fromJson(json);
}

/// @nodoc
mixin _$PermissionsData {
  Member? get member => throw _privateConstructorUsedError;
  Map<String, Permission>? get permissions =>
      throw _privateConstructorUsedError;
  Summary? get summary => throw _privateConstructorUsedError;

  /// Serializes this PermissionsData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PermissionsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PermissionsDataCopyWith<PermissionsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionsDataCopyWith<$Res> {
  factory $PermissionsDataCopyWith(
          PermissionsData value, $Res Function(PermissionsData) then) =
      _$PermissionsDataCopyWithImpl<$Res, PermissionsData>;
  @useResult
  $Res call(
      {Member? member, Map<String, Permission>? permissions, Summary? summary});

  $MemberCopyWith<$Res>? get member;
  $SummaryCopyWith<$Res>? get summary;
}

/// @nodoc
class _$PermissionsDataCopyWithImpl<$Res, $Val extends PermissionsData>
    implements $PermissionsDataCopyWith<$Res> {
  _$PermissionsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PermissionsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? member = freezed,
    Object? permissions = freezed,
    Object? summary = freezed,
  }) {
    return _then(_value.copyWith(
      member: freezed == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as Member?,
      permissions: freezed == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as Map<String, Permission>?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as Summary?,
    ) as $Val);
  }

  /// Create a copy of PermissionsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MemberCopyWith<$Res>? get member {
    if (_value.member == null) {
      return null;
    }

    return $MemberCopyWith<$Res>(_value.member!, (value) {
      return _then(_value.copyWith(member: value) as $Val);
    });
  }

  /// Create a copy of PermissionsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SummaryCopyWith<$Res>? get summary {
    if (_value.summary == null) {
      return null;
    }

    return $SummaryCopyWith<$Res>(_value.summary!, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PermissionsDataImplCopyWith<$Res>
    implements $PermissionsDataCopyWith<$Res> {
  factory _$$PermissionsDataImplCopyWith(_$PermissionsDataImpl value,
          $Res Function(_$PermissionsDataImpl) then) =
      __$$PermissionsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Member? member, Map<String, Permission>? permissions, Summary? summary});

  @override
  $MemberCopyWith<$Res>? get member;
  @override
  $SummaryCopyWith<$Res>? get summary;
}

/// @nodoc
class __$$PermissionsDataImplCopyWithImpl<$Res>
    extends _$PermissionsDataCopyWithImpl<$Res, _$PermissionsDataImpl>
    implements _$$PermissionsDataImplCopyWith<$Res> {
  __$$PermissionsDataImplCopyWithImpl(
      _$PermissionsDataImpl _value, $Res Function(_$PermissionsDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PermissionsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? member = freezed,
    Object? permissions = freezed,
    Object? summary = freezed,
  }) {
    return _then(_$PermissionsDataImpl(
      member: freezed == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as Member?,
      permissions: freezed == permissions
          ? _value._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as Map<String, Permission>?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as Summary?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PermissionsDataImpl implements _PermissionsData {
  const _$PermissionsDataImpl(
      {this.member, final Map<String, Permission>? permissions, this.summary})
      : _permissions = permissions;

  factory _$PermissionsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermissionsDataImplFromJson(json);

  @override
  final Member? member;
  final Map<String, Permission>? _permissions;
  @override
  Map<String, Permission>? get permissions {
    final value = _permissions;
    if (value == null) return null;
    if (_permissions is EqualUnmodifiableMapView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final Summary? summary;

  @override
  String toString() {
    return 'PermissionsData(member: $member, permissions: $permissions, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionsDataImpl &&
            (identical(other.member, member) || other.member == member) &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, member,
      const DeepCollectionEquality().hash(_permissions), summary);

  /// Create a copy of PermissionsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionsDataImplCopyWith<_$PermissionsDataImpl> get copyWith =>
      __$$PermissionsDataImplCopyWithImpl<_$PermissionsDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermissionsDataImplToJson(
      this,
    );
  }
}

abstract class _PermissionsData implements PermissionsData {
  const factory _PermissionsData(
      {final Member? member,
      final Map<String, Permission>? permissions,
      final Summary? summary}) = _$PermissionsDataImpl;

  factory _PermissionsData.fromJson(Map<String, dynamic> json) =
      _$PermissionsDataImpl.fromJson;

  @override
  Member? get member;
  @override
  Map<String, Permission>? get permissions;
  @override
  Summary? get summary;

  /// Create a copy of PermissionsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermissionsDataImplCopyWith<_$PermissionsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
