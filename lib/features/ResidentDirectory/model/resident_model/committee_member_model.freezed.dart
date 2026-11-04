// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'committee_member_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommitteeMember _$CommitteeMemberFromJson(Map<String, dynamic> json) {
  return _CommitteeMember.fromJson(json);
}

/// @nodoc
mixin _$CommitteeMember {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  String? get roleDisplayName => throw _privateConstructorUsedError;
  CommitteeCategory? get category => throw _privateConstructorUsedError;
  bool? get isLeadership => throw _privateConstructorUsedError;

  /// Serializes this CommitteeMember to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommitteeMember
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommitteeMemberCopyWith<CommitteeMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommitteeMemberCopyWith<$Res> {
  factory $CommitteeMemberCopyWith(
          CommitteeMember value, $Res Function(CommitteeMember) then) =
      _$CommitteeMemberCopyWithImpl<$Res, CommitteeMember>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? role,
      String? roleDisplayName,
      CommitteeCategory? category,
      bool? isLeadership});

  $CommitteeCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class _$CommitteeMemberCopyWithImpl<$Res, $Val extends CommitteeMember>
    implements $CommitteeMemberCopyWith<$Res> {
  _$CommitteeMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommitteeMember
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? role = freezed,
    Object? roleDisplayName = freezed,
    Object? category = freezed,
    Object? isLeadership = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      roleDisplayName: freezed == roleDisplayName
          ? _value.roleDisplayName
          : roleDisplayName // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CommitteeCategory?,
      isLeadership: freezed == isLeadership
          ? _value.isLeadership
          : isLeadership // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of CommitteeMember
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommitteeCategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CommitteeCategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommitteeMemberImplCopyWith<$Res>
    implements $CommitteeMemberCopyWith<$Res> {
  factory _$$CommitteeMemberImplCopyWith(_$CommitteeMemberImpl value,
          $Res Function(_$CommitteeMemberImpl) then) =
      __$$CommitteeMemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? role,
      String? roleDisplayName,
      CommitteeCategory? category,
      bool? isLeadership});

  @override
  $CommitteeCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class __$$CommitteeMemberImplCopyWithImpl<$Res>
    extends _$CommitteeMemberCopyWithImpl<$Res, _$CommitteeMemberImpl>
    implements _$$CommitteeMemberImplCopyWith<$Res> {
  __$$CommitteeMemberImplCopyWithImpl(
      _$CommitteeMemberImpl _value, $Res Function(_$CommitteeMemberImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommitteeMember
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? role = freezed,
    Object? roleDisplayName = freezed,
    Object? category = freezed,
    Object? isLeadership = freezed,
  }) {
    return _then(_$CommitteeMemberImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      roleDisplayName: freezed == roleDisplayName
          ? _value.roleDisplayName
          : roleDisplayName // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CommitteeCategory?,
      isLeadership: freezed == isLeadership
          ? _value.isLeadership
          : isLeadership // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$CommitteeMemberImpl implements _CommitteeMember {
  const _$CommitteeMemberImpl(
      {this.id,
      this.name,
      this.role,
      this.roleDisplayName,
      this.category,
      this.isLeadership});

  factory _$CommitteeMemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommitteeMemberImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? role;
  @override
  final String? roleDisplayName;
  @override
  final CommitteeCategory? category;
  @override
  final bool? isLeadership;

  @override
  String toString() {
    return 'CommitteeMember(id: $id, name: $name, role: $role, roleDisplayName: $roleDisplayName, category: $category, isLeadership: $isLeadership)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommitteeMemberImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.roleDisplayName, roleDisplayName) ||
                other.roleDisplayName == roleDisplayName) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.isLeadership, isLeadership) ||
                other.isLeadership == isLeadership));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, role, roleDisplayName, category, isLeadership);

  /// Create a copy of CommitteeMember
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommitteeMemberImplCopyWith<_$CommitteeMemberImpl> get copyWith =>
      __$$CommitteeMemberImplCopyWithImpl<_$CommitteeMemberImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommitteeMemberImplToJson(
      this,
    );
  }
}

abstract class _CommitteeMember implements CommitteeMember {
  const factory _CommitteeMember(
      {final int? id,
      final String? name,
      final String? role,
      final String? roleDisplayName,
      final CommitteeCategory? category,
      final bool? isLeadership}) = _$CommitteeMemberImpl;

  factory _CommitteeMember.fromJson(Map<String, dynamic> json) =
      _$CommitteeMemberImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get role;
  @override
  String? get roleDisplayName;
  @override
  CommitteeCategory? get category;
  @override
  bool? get isLeadership;

  /// Create a copy of CommitteeMember
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommitteeMemberImplCopyWith<_$CommitteeMemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
