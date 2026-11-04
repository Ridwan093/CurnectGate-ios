// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leadership_role_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LeadershipRole _$LeadershipRoleFromJson(Map<String, dynamic> json) {
  return _LeadershipRole.fromJson(json);
}

/// @nodoc
mixin _$LeadershipRole {
  String? get type => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get organization => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  int? get termNumber => throw _privateConstructorUsedError;

  /// Serializes this LeadershipRole to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeadershipRole
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeadershipRoleCopyWith<LeadershipRole> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadershipRoleCopyWith<$Res> {
  factory $LeadershipRoleCopyWith(
          LeadershipRole value, $Res Function(LeadershipRole) then) =
      _$LeadershipRoleCopyWithImpl<$Res, LeadershipRole>;
  @useResult
  $Res call(
      {String? type,
      String? title,
      String? organization,
      String? category,
      int? termNumber});
}

/// @nodoc
class _$LeadershipRoleCopyWithImpl<$Res, $Val extends LeadershipRole>
    implements $LeadershipRoleCopyWith<$Res> {
  _$LeadershipRoleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeadershipRole
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? title = freezed,
    Object? organization = freezed,
    Object? category = freezed,
    Object? termNumber = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      organization: freezed == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      termNumber: freezed == termNumber
          ? _value.termNumber
          : termNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeadershipRoleImplCopyWith<$Res>
    implements $LeadershipRoleCopyWith<$Res> {
  factory _$$LeadershipRoleImplCopyWith(_$LeadershipRoleImpl value,
          $Res Function(_$LeadershipRoleImpl) then) =
      __$$LeadershipRoleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? type,
      String? title,
      String? organization,
      String? category,
      int? termNumber});
}

/// @nodoc
class __$$LeadershipRoleImplCopyWithImpl<$Res>
    extends _$LeadershipRoleCopyWithImpl<$Res, _$LeadershipRoleImpl>
    implements _$$LeadershipRoleImplCopyWith<$Res> {
  __$$LeadershipRoleImplCopyWithImpl(
      _$LeadershipRoleImpl _value, $Res Function(_$LeadershipRoleImpl) _then)
      : super(_value, _then);

  /// Create a copy of LeadershipRole
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? title = freezed,
    Object? organization = freezed,
    Object? category = freezed,
    Object? termNumber = freezed,
  }) {
    return _then(_$LeadershipRoleImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      organization: freezed == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      termNumber: freezed == termNumber
          ? _value.termNumber
          : termNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$LeadershipRoleImpl implements _LeadershipRole {
  const _$LeadershipRoleImpl(
      {this.type,
      this.title,
      this.organization,
      this.category,
      this.termNumber});

  factory _$LeadershipRoleImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadershipRoleImplFromJson(json);

  @override
  final String? type;
  @override
  final String? title;
  @override
  final String? organization;
  @override
  final String? category;
  @override
  final int? termNumber;

  @override
  String toString() {
    return 'LeadershipRole(type: $type, title: $title, organization: $organization, category: $category, termNumber: $termNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadershipRoleImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.organization, organization) ||
                other.organization == organization) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.termNumber, termNumber) ||
                other.termNumber == termNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, title, organization, category, termNumber);

  /// Create a copy of LeadershipRole
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadershipRoleImplCopyWith<_$LeadershipRoleImpl> get copyWith =>
      __$$LeadershipRoleImplCopyWithImpl<_$LeadershipRoleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadershipRoleImplToJson(
      this,
    );
  }
}

abstract class _LeadershipRole implements LeadershipRole {
  const factory _LeadershipRole(
      {final String? type,
      final String? title,
      final String? organization,
      final String? category,
      final int? termNumber}) = _$LeadershipRoleImpl;

  factory _LeadershipRole.fromJson(Map<String, dynamic> json) =
      _$LeadershipRoleImpl.fromJson;

  @override
  String? get type;
  @override
  String? get title;
  @override
  String? get organization;
  @override
  String? get category;
  @override
  int? get termNumber;

  /// Create a copy of LeadershipRole
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeadershipRoleImplCopyWith<_$LeadershipRoleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
