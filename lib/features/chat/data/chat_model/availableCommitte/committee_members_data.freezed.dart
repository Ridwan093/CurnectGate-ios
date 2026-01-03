// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'committee_members_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommitteeMembersData _$CommitteeMembersDataFromJson(Map<String, dynamic> json) {
  return _CommitteeMembersData.fromJson(json);
}

/// @nodoc
mixin _$CommitteeMembersData {
  List<CommitteeMember>? get members => throw _privateConstructorUsedError;
  int? get committeeCount => throw _privateConstructorUsedError;
  int? get boardCount => throw _privateConstructorUsedError;
  int? get totalCount => throw _privateConstructorUsedError;

  /// Serializes this CommitteeMembersData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommitteeMembersData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommitteeMembersDataCopyWith<CommitteeMembersData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommitteeMembersDataCopyWith<$Res> {
  factory $CommitteeMembersDataCopyWith(CommitteeMembersData value,
          $Res Function(CommitteeMembersData) then) =
      _$CommitteeMembersDataCopyWithImpl<$Res, CommitteeMembersData>;
  @useResult
  $Res call(
      {List<CommitteeMember>? members,
      int? committeeCount,
      int? boardCount,
      int? totalCount});
}

/// @nodoc
class _$CommitteeMembersDataCopyWithImpl<$Res,
        $Val extends CommitteeMembersData>
    implements $CommitteeMembersDataCopyWith<$Res> {
  _$CommitteeMembersDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommitteeMembersData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? members = freezed,
    Object? committeeCount = freezed,
    Object? boardCount = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_value.copyWith(
      members: freezed == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<CommitteeMember>?,
      committeeCount: freezed == committeeCount
          ? _value.committeeCount
          : committeeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      boardCount: freezed == boardCount
          ? _value.boardCount
          : boardCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommitteeMembersDataImplCopyWith<$Res>
    implements $CommitteeMembersDataCopyWith<$Res> {
  factory _$$CommitteeMembersDataImplCopyWith(_$CommitteeMembersDataImpl value,
          $Res Function(_$CommitteeMembersDataImpl) then) =
      __$$CommitteeMembersDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CommitteeMember>? members,
      int? committeeCount,
      int? boardCount,
      int? totalCount});
}

/// @nodoc
class __$$CommitteeMembersDataImplCopyWithImpl<$Res>
    extends _$CommitteeMembersDataCopyWithImpl<$Res, _$CommitteeMembersDataImpl>
    implements _$$CommitteeMembersDataImplCopyWith<$Res> {
  __$$CommitteeMembersDataImplCopyWithImpl(_$CommitteeMembersDataImpl _value,
      $Res Function(_$CommitteeMembersDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommitteeMembersData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? members = freezed,
    Object? committeeCount = freezed,
    Object? boardCount = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_$CommitteeMembersDataImpl(
      members: freezed == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<CommitteeMember>?,
      committeeCount: freezed == committeeCount
          ? _value.committeeCount
          : committeeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      boardCount: freezed == boardCount
          ? _value.boardCount
          : boardCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$CommitteeMembersDataImpl implements _CommitteeMembersData {
  const _$CommitteeMembersDataImpl(
      {final List<CommitteeMember>? members,
      this.committeeCount,
      this.boardCount,
      this.totalCount})
      : _members = members;

  factory _$CommitteeMembersDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommitteeMembersDataImplFromJson(json);

  final List<CommitteeMember>? _members;
  @override
  List<CommitteeMember>? get members {
    final value = _members;
    if (value == null) return null;
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? committeeCount;
  @override
  final int? boardCount;
  @override
  final int? totalCount;

  @override
  String toString() {
    return 'CommitteeMembersData(members: $members, committeeCount: $committeeCount, boardCount: $boardCount, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommitteeMembersDataImpl &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            (identical(other.committeeCount, committeeCount) ||
                other.committeeCount == committeeCount) &&
            (identical(other.boardCount, boardCount) ||
                other.boardCount == boardCount) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_members),
      committeeCount,
      boardCount,
      totalCount);

  /// Create a copy of CommitteeMembersData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommitteeMembersDataImplCopyWith<_$CommitteeMembersDataImpl>
      get copyWith =>
          __$$CommitteeMembersDataImplCopyWithImpl<_$CommitteeMembersDataImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommitteeMembersDataImplToJson(
      this,
    );
  }
}

abstract class _CommitteeMembersData implements CommitteeMembersData {
  const factory _CommitteeMembersData(
      {final List<CommitteeMember>? members,
      final int? committeeCount,
      final int? boardCount,
      final int? totalCount}) = _$CommitteeMembersDataImpl;

  factory _CommitteeMembersData.fromJson(Map<String, dynamic> json) =
      _$CommitteeMembersDataImpl.fromJson;

  @override
  List<CommitteeMember>? get members;
  @override
  int? get committeeCount;
  @override
  int? get boardCount;
  @override
  int? get totalCount;

  /// Create a copy of CommitteeMembersData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommitteeMembersDataImplCopyWith<_$CommitteeMembersDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
