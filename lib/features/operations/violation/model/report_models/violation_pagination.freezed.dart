// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'violation_pagination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ViolationPagination _$ViolationPaginationFromJson(Map<String, dynamic> json) {
  return _ViolationPagination.fromJson(json);
}

/// @nodoc
mixin _$ViolationPagination {
  int get currentPage => throw _privateConstructorUsedError;
  int get lastPage => throw _privateConstructorUsedError;
  int get perPage => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int? get from => throw _privateConstructorUsedError;
  int? get to => throw _privateConstructorUsedError;

  /// Serializes this ViolationPagination to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ViolationPagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ViolationPaginationCopyWith<ViolationPagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViolationPaginationCopyWith<$Res> {
  factory $ViolationPaginationCopyWith(
          ViolationPagination value, $Res Function(ViolationPagination) then) =
      _$ViolationPaginationCopyWithImpl<$Res, ViolationPagination>;
  @useResult
  $Res call(
      {int currentPage,
      int lastPage,
      int perPage,
      int total,
      int? from,
      int? to});
}

/// @nodoc
class _$ViolationPaginationCopyWithImpl<$Res, $Val extends ViolationPagination>
    implements $ViolationPaginationCopyWith<$Res> {
  _$ViolationPaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ViolationPagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? lastPage = null,
    Object? perPage = null,
    Object? total = null,
    Object? from = freezed,
    Object? to = freezed,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ViolationPaginationImplCopyWith<$Res>
    implements $ViolationPaginationCopyWith<$Res> {
  factory _$$ViolationPaginationImplCopyWith(_$ViolationPaginationImpl value,
          $Res Function(_$ViolationPaginationImpl) then) =
      __$$ViolationPaginationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentPage,
      int lastPage,
      int perPage,
      int total,
      int? from,
      int? to});
}

/// @nodoc
class __$$ViolationPaginationImplCopyWithImpl<$Res>
    extends _$ViolationPaginationCopyWithImpl<$Res, _$ViolationPaginationImpl>
    implements _$$ViolationPaginationImplCopyWith<$Res> {
  __$$ViolationPaginationImplCopyWithImpl(_$ViolationPaginationImpl _value,
      $Res Function(_$ViolationPaginationImpl) _then)
      : super(_value, _then);

  /// Create a copy of ViolationPagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? lastPage = null,
    Object? perPage = null,
    Object? total = null,
    Object? from = freezed,
    Object? to = freezed,
  }) {
    return _then(_$ViolationPaginationImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$ViolationPaginationImpl implements _ViolationPagination {
  const _$ViolationPaginationImpl(
      {this.currentPage = 1,
      this.lastPage = 1,
      this.perPage = 15,
      this.total = 0,
      this.from,
      this.to});

  factory _$ViolationPaginationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ViolationPaginationImplFromJson(json);

  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int lastPage;
  @override
  @JsonKey()
  final int perPage;
  @override
  @JsonKey()
  final int total;
  @override
  final int? from;
  @override
  final int? to;

  @override
  String toString() {
    return 'ViolationPagination(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total, from: $from, to: $to)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViolationPaginationImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPage, lastPage, perPage, total, from, to);

  /// Create a copy of ViolationPagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ViolationPaginationImplCopyWith<_$ViolationPaginationImpl> get copyWith =>
      __$$ViolationPaginationImplCopyWithImpl<_$ViolationPaginationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ViolationPaginationImplToJson(
      this,
    );
  }
}

abstract class _ViolationPagination implements ViolationPagination {
  const factory _ViolationPagination(
      {final int currentPage,
      final int lastPage,
      final int perPage,
      final int total,
      final int? from,
      final int? to}) = _$ViolationPaginationImpl;

  factory _ViolationPagination.fromJson(Map<String, dynamic> json) =
      _$ViolationPaginationImpl.fromJson;

  @override
  int get currentPage;
  @override
  int get lastPage;
  @override
  int get perPage;
  @override
  int get total;
  @override
  int? get from;
  @override
  int? get to;

  /// Create a copy of ViolationPagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViolationPaginationImplCopyWith<_$ViolationPaginationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
