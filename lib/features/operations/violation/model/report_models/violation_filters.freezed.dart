// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'violation_filters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppliedFilters _$AppliedFiltersFromJson(Map<String, dynamic> json) {
  return _AppliedFilters.fromJson(json);
}

/// @nodoc
mixin _$AppliedFilters {
  String get status => throw _privateConstructorUsedError;
  String? get priority => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  String? get assignedTo => throw _privateConstructorUsedError;
  String? get startDate => throw _privateConstructorUsedError;
  String? get endDate => throw _privateConstructorUsedError;
  String get search => throw _privateConstructorUsedError;

  /// Serializes this AppliedFilters to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppliedFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppliedFiltersCopyWith<AppliedFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppliedFiltersCopyWith<$Res> {
  factory $AppliedFiltersCopyWith(
          AppliedFilters value, $Res Function(AppliedFilters) then) =
      _$AppliedFiltersCopyWithImpl<$Res, AppliedFilters>;
  @useResult
  $Res call(
      {String status,
      String? priority,
      String? categoryId,
      String? assignedTo,
      String? startDate,
      String? endDate,
      String search});
}

/// @nodoc
class _$AppliedFiltersCopyWithImpl<$Res, $Val extends AppliedFilters>
    implements $AppliedFiltersCopyWith<$Res> {
  _$AppliedFiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppliedFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? priority = freezed,
    Object? categoryId = freezed,
    Object? assignedTo = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? search = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedTo: freezed == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppliedFiltersImplCopyWith<$Res>
    implements $AppliedFiltersCopyWith<$Res> {
  factory _$$AppliedFiltersImplCopyWith(_$AppliedFiltersImpl value,
          $Res Function(_$AppliedFiltersImpl) then) =
      __$$AppliedFiltersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      String? priority,
      String? categoryId,
      String? assignedTo,
      String? startDate,
      String? endDate,
      String search});
}

/// @nodoc
class __$$AppliedFiltersImplCopyWithImpl<$Res>
    extends _$AppliedFiltersCopyWithImpl<$Res, _$AppliedFiltersImpl>
    implements _$$AppliedFiltersImplCopyWith<$Res> {
  __$$AppliedFiltersImplCopyWithImpl(
      _$AppliedFiltersImpl _value, $Res Function(_$AppliedFiltersImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppliedFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? priority = freezed,
    Object? categoryId = freezed,
    Object? assignedTo = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? search = null,
  }) {
    return _then(_$AppliedFiltersImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedTo: freezed == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$AppliedFiltersImpl implements _AppliedFilters {
  const _$AppliedFiltersImpl(
      {this.status = '',
      this.priority,
      this.categoryId,
      this.assignedTo,
      this.startDate,
      this.endDate,
      this.search = ''});

  factory _$AppliedFiltersImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppliedFiltersImplFromJson(json);

  @override
  @JsonKey()
  final String status;
  @override
  final String? priority;
  @override
  final String? categoryId;
  @override
  final String? assignedTo;
  @override
  final String? startDate;
  @override
  final String? endDate;
  @override
  @JsonKey()
  final String search;

  @override
  String toString() {
    return 'AppliedFilters(status: $status, priority: $priority, categoryId: $categoryId, assignedTo: $assignedTo, startDate: $startDate, endDate: $endDate, search: $search)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppliedFiltersImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.search, search) || other.search == search));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, priority, categoryId,
      assignedTo, startDate, endDate, search);

  /// Create a copy of AppliedFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppliedFiltersImplCopyWith<_$AppliedFiltersImpl> get copyWith =>
      __$$AppliedFiltersImplCopyWithImpl<_$AppliedFiltersImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppliedFiltersImplToJson(
      this,
    );
  }
}

abstract class _AppliedFilters implements AppliedFilters {
  const factory _AppliedFilters(
      {final String status,
      final String? priority,
      final String? categoryId,
      final String? assignedTo,
      final String? startDate,
      final String? endDate,
      final String search}) = _$AppliedFiltersImpl;

  factory _AppliedFilters.fromJson(Map<String, dynamic> json) =
      _$AppliedFiltersImpl.fromJson;

  @override
  String get status;
  @override
  String? get priority;
  @override
  String? get categoryId;
  @override
  String? get assignedTo;
  @override
  String? get startDate;
  @override
  String? get endDate;
  @override
  String get search;

  /// Create a copy of AppliedFilters
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppliedFiltersImplCopyWith<_$AppliedFiltersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ViolationFilters _$ViolationFiltersFromJson(Map<String, dynamic> json) {
  return _ViolationFilters.fromJson(json);
}

/// @nodoc
mixin _$ViolationFilters {
  String get currentFilter => throw _privateConstructorUsedError;
  Map<String, String> get availableFilters =>
      throw _privateConstructorUsedError;
  AppliedFilters? get appliedFilters => throw _privateConstructorUsedError;

  /// Serializes this ViolationFilters to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ViolationFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ViolationFiltersCopyWith<ViolationFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViolationFiltersCopyWith<$Res> {
  factory $ViolationFiltersCopyWith(
          ViolationFilters value, $Res Function(ViolationFilters) then) =
      _$ViolationFiltersCopyWithImpl<$Res, ViolationFilters>;
  @useResult
  $Res call(
      {String currentFilter,
      Map<String, String> availableFilters,
      AppliedFilters? appliedFilters});

  $AppliedFiltersCopyWith<$Res>? get appliedFilters;
}

/// @nodoc
class _$ViolationFiltersCopyWithImpl<$Res, $Val extends ViolationFilters>
    implements $ViolationFiltersCopyWith<$Res> {
  _$ViolationFiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ViolationFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentFilter = null,
    Object? availableFilters = null,
    Object? appliedFilters = freezed,
  }) {
    return _then(_value.copyWith(
      currentFilter: null == currentFilter
          ? _value.currentFilter
          : currentFilter // ignore: cast_nullable_to_non_nullable
              as String,
      availableFilters: null == availableFilters
          ? _value.availableFilters
          : availableFilters // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      appliedFilters: freezed == appliedFilters
          ? _value.appliedFilters
          : appliedFilters // ignore: cast_nullable_to_non_nullable
              as AppliedFilters?,
    ) as $Val);
  }

  /// Create a copy of ViolationFilters
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppliedFiltersCopyWith<$Res>? get appliedFilters {
    if (_value.appliedFilters == null) {
      return null;
    }

    return $AppliedFiltersCopyWith<$Res>(_value.appliedFilters!, (value) {
      return _then(_value.copyWith(appliedFilters: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ViolationFiltersImplCopyWith<$Res>
    implements $ViolationFiltersCopyWith<$Res> {
  factory _$$ViolationFiltersImplCopyWith(_$ViolationFiltersImpl value,
          $Res Function(_$ViolationFiltersImpl) then) =
      __$$ViolationFiltersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String currentFilter,
      Map<String, String> availableFilters,
      AppliedFilters? appliedFilters});

  @override
  $AppliedFiltersCopyWith<$Res>? get appliedFilters;
}

/// @nodoc
class __$$ViolationFiltersImplCopyWithImpl<$Res>
    extends _$ViolationFiltersCopyWithImpl<$Res, _$ViolationFiltersImpl>
    implements _$$ViolationFiltersImplCopyWith<$Res> {
  __$$ViolationFiltersImplCopyWithImpl(_$ViolationFiltersImpl _value,
      $Res Function(_$ViolationFiltersImpl) _then)
      : super(_value, _then);

  /// Create a copy of ViolationFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentFilter = null,
    Object? availableFilters = null,
    Object? appliedFilters = freezed,
  }) {
    return _then(_$ViolationFiltersImpl(
      currentFilter: null == currentFilter
          ? _value.currentFilter
          : currentFilter // ignore: cast_nullable_to_non_nullable
              as String,
      availableFilters: null == availableFilters
          ? _value._availableFilters
          : availableFilters // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      appliedFilters: freezed == appliedFilters
          ? _value.appliedFilters
          : appliedFilters // ignore: cast_nullable_to_non_nullable
              as AppliedFilters?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$ViolationFiltersImpl implements _ViolationFilters {
  const _$ViolationFiltersImpl(
      {this.currentFilter = '',
      final Map<String, String> availableFilters = const {},
      this.appliedFilters})
      : _availableFilters = availableFilters;

  factory _$ViolationFiltersImpl.fromJson(Map<String, dynamic> json) =>
      _$$ViolationFiltersImplFromJson(json);

  @override
  @JsonKey()
  final String currentFilter;
  final Map<String, String> _availableFilters;
  @override
  @JsonKey()
  Map<String, String> get availableFilters {
    if (_availableFilters is EqualUnmodifiableMapView) return _availableFilters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_availableFilters);
  }

  @override
  final AppliedFilters? appliedFilters;

  @override
  String toString() {
    return 'ViolationFilters(currentFilter: $currentFilter, availableFilters: $availableFilters, appliedFilters: $appliedFilters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViolationFiltersImpl &&
            (identical(other.currentFilter, currentFilter) ||
                other.currentFilter == currentFilter) &&
            const DeepCollectionEquality()
                .equals(other._availableFilters, _availableFilters) &&
            (identical(other.appliedFilters, appliedFilters) ||
                other.appliedFilters == appliedFilters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentFilter,
      const DeepCollectionEquality().hash(_availableFilters), appliedFilters);

  /// Create a copy of ViolationFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ViolationFiltersImplCopyWith<_$ViolationFiltersImpl> get copyWith =>
      __$$ViolationFiltersImplCopyWithImpl<_$ViolationFiltersImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ViolationFiltersImplToJson(
      this,
    );
  }
}

abstract class _ViolationFilters implements ViolationFilters {
  const factory _ViolationFilters(
      {final String currentFilter,
      final Map<String, String> availableFilters,
      final AppliedFilters? appliedFilters}) = _$ViolationFiltersImpl;

  factory _ViolationFilters.fromJson(Map<String, dynamic> json) =
      _$ViolationFiltersImpl.fromJson;

  @override
  String get currentFilter;
  @override
  Map<String, String> get availableFilters;
  @override
  AppliedFilters? get appliedFilters;

  /// Create a copy of ViolationFilters
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViolationFiltersImplCopyWith<_$ViolationFiltersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
