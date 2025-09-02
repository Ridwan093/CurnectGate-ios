// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'directory_filters_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DirectoryFilters _$DirectoryFiltersFromJson(Map<String, dynamic> json) {
  return _DirectoryFilters.fromJson(json);
}

/// @nodoc
mixin _$DirectoryFilters {
  String? get search => throw _privateConstructorUsedError;
  bool? get committeeMember => throw _privateConstructorUsedError;
  bool? get boardMember => throw _privateConstructorUsedError;

  /// Serializes this DirectoryFilters to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DirectoryFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DirectoryFiltersCopyWith<DirectoryFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectoryFiltersCopyWith<$Res> {
  factory $DirectoryFiltersCopyWith(
          DirectoryFilters value, $Res Function(DirectoryFilters) then) =
      _$DirectoryFiltersCopyWithImpl<$Res, DirectoryFilters>;
  @useResult
  $Res call({String? search, bool? committeeMember, bool? boardMember});
}

/// @nodoc
class _$DirectoryFiltersCopyWithImpl<$Res, $Val extends DirectoryFilters>
    implements $DirectoryFiltersCopyWith<$Res> {
  _$DirectoryFiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DirectoryFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
    Object? committeeMember = freezed,
    Object? boardMember = freezed,
  }) {
    return _then(_value.copyWith(
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      committeeMember: freezed == committeeMember
          ? _value.committeeMember
          : committeeMember // ignore: cast_nullable_to_non_nullable
              as bool?,
      boardMember: freezed == boardMember
          ? _value.boardMember
          : boardMember // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DirectoryFiltersImplCopyWith<$Res>
    implements $DirectoryFiltersCopyWith<$Res> {
  factory _$$DirectoryFiltersImplCopyWith(_$DirectoryFiltersImpl value,
          $Res Function(_$DirectoryFiltersImpl) then) =
      __$$DirectoryFiltersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? search, bool? committeeMember, bool? boardMember});
}

/// @nodoc
class __$$DirectoryFiltersImplCopyWithImpl<$Res>
    extends _$DirectoryFiltersCopyWithImpl<$Res, _$DirectoryFiltersImpl>
    implements _$$DirectoryFiltersImplCopyWith<$Res> {
  __$$DirectoryFiltersImplCopyWithImpl(_$DirectoryFiltersImpl _value,
      $Res Function(_$DirectoryFiltersImpl) _then)
      : super(_value, _then);

  /// Create a copy of DirectoryFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
    Object? committeeMember = freezed,
    Object? boardMember = freezed,
  }) {
    return _then(_$DirectoryFiltersImpl(
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      committeeMember: freezed == committeeMember
          ? _value.committeeMember
          : committeeMember // ignore: cast_nullable_to_non_nullable
              as bool?,
      boardMember: freezed == boardMember
          ? _value.boardMember
          : boardMember // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$DirectoryFiltersImpl implements _DirectoryFilters {
  const _$DirectoryFiltersImpl(
      {this.search, this.committeeMember, this.boardMember});

  factory _$DirectoryFiltersImpl.fromJson(Map<String, dynamic> json) =>
      _$$DirectoryFiltersImplFromJson(json);

  @override
  final String? search;
  @override
  final bool? committeeMember;
  @override
  final bool? boardMember;

  @override
  String toString() {
    return 'DirectoryFilters(search: $search, committeeMember: $committeeMember, boardMember: $boardMember)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DirectoryFiltersImpl &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.committeeMember, committeeMember) ||
                other.committeeMember == committeeMember) &&
            (identical(other.boardMember, boardMember) ||
                other.boardMember == boardMember));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, search, committeeMember, boardMember);

  /// Create a copy of DirectoryFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DirectoryFiltersImplCopyWith<_$DirectoryFiltersImpl> get copyWith =>
      __$$DirectoryFiltersImplCopyWithImpl<_$DirectoryFiltersImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DirectoryFiltersImplToJson(
      this,
    );
  }
}

abstract class _DirectoryFilters implements DirectoryFilters {
  const factory _DirectoryFilters(
      {final String? search,
      final bool? committeeMember,
      final bool? boardMember}) = _$DirectoryFiltersImpl;

  factory _DirectoryFilters.fromJson(Map<String, dynamic> json) =
      _$DirectoryFiltersImpl.fromJson;

  @override
  String? get search;
  @override
  bool? get committeeMember;
  @override
  bool? get boardMember;

  /// Create a copy of DirectoryFilters
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DirectoryFiltersImplCopyWith<_$DirectoryFiltersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
