// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'duty_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DutyData _$DutyDataFromJson(Map<String, dynamic> json) {
  return _DutyData.fromJson(json);
}

/// @nodoc
mixin _$DutyData {
  String? get date => throw _privateConstructorUsedError;
  String? get day => throw _privateConstructorUsedError;
  MyDuty? get myDuty => throw _privateConstructorUsedError;
  List<dynamic>? get onDutyPersonnel => throw _privateConstructorUsedError;
  List<TodayShift>? get todayShifts => throw _privateConstructorUsedError;
  int? get totalOnDuty => throw _privateConstructorUsedError;

  /// Serializes this DutyData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DutyData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DutyDataCopyWith<DutyData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DutyDataCopyWith<$Res> {
  factory $DutyDataCopyWith(DutyData value, $Res Function(DutyData) then) =
      _$DutyDataCopyWithImpl<$Res, DutyData>;
  @useResult
  $Res call(
      {String? date,
      String? day,
      MyDuty? myDuty,
      List<dynamic>? onDutyPersonnel,
      List<TodayShift>? todayShifts,
      int? totalOnDuty});

  $MyDutyCopyWith<$Res>? get myDuty;
}

/// @nodoc
class _$DutyDataCopyWithImpl<$Res, $Val extends DutyData>
    implements $DutyDataCopyWith<$Res> {
  _$DutyDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DutyData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? day = freezed,
    Object? myDuty = freezed,
    Object? onDutyPersonnel = freezed,
    Object? todayShifts = freezed,
    Object? totalOnDuty = freezed,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String?,
      myDuty: freezed == myDuty
          ? _value.myDuty
          : myDuty // ignore: cast_nullable_to_non_nullable
              as MyDuty?,
      onDutyPersonnel: freezed == onDutyPersonnel
          ? _value.onDutyPersonnel
          : onDutyPersonnel // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      todayShifts: freezed == todayShifts
          ? _value.todayShifts
          : todayShifts // ignore: cast_nullable_to_non_nullable
              as List<TodayShift>?,
      totalOnDuty: freezed == totalOnDuty
          ? _value.totalOnDuty
          : totalOnDuty // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of DutyData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MyDutyCopyWith<$Res>? get myDuty {
    if (_value.myDuty == null) {
      return null;
    }

    return $MyDutyCopyWith<$Res>(_value.myDuty!, (value) {
      return _then(_value.copyWith(myDuty: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DutyDataImplCopyWith<$Res>
    implements $DutyDataCopyWith<$Res> {
  factory _$$DutyDataImplCopyWith(
          _$DutyDataImpl value, $Res Function(_$DutyDataImpl) then) =
      __$$DutyDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? date,
      String? day,
      MyDuty? myDuty,
      List<dynamic>? onDutyPersonnel,
      List<TodayShift>? todayShifts,
      int? totalOnDuty});

  @override
  $MyDutyCopyWith<$Res>? get myDuty;
}

/// @nodoc
class __$$DutyDataImplCopyWithImpl<$Res>
    extends _$DutyDataCopyWithImpl<$Res, _$DutyDataImpl>
    implements _$$DutyDataImplCopyWith<$Res> {
  __$$DutyDataImplCopyWithImpl(
      _$DutyDataImpl _value, $Res Function(_$DutyDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of DutyData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? day = freezed,
    Object? myDuty = freezed,
    Object? onDutyPersonnel = freezed,
    Object? todayShifts = freezed,
    Object? totalOnDuty = freezed,
  }) {
    return _then(_$DutyDataImpl(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String?,
      myDuty: freezed == myDuty
          ? _value.myDuty
          : myDuty // ignore: cast_nullable_to_non_nullable
              as MyDuty?,
      onDutyPersonnel: freezed == onDutyPersonnel
          ? _value._onDutyPersonnel
          : onDutyPersonnel // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      todayShifts: freezed == todayShifts
          ? _value._todayShifts
          : todayShifts // ignore: cast_nullable_to_non_nullable
              as List<TodayShift>?,
      totalOnDuty: freezed == totalOnDuty
          ? _value.totalOnDuty
          : totalOnDuty // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$DutyDataImpl implements _DutyData {
  const _$DutyDataImpl(
      {this.date,
      this.day,
      this.myDuty,
      final List<dynamic>? onDutyPersonnel,
      final List<TodayShift>? todayShifts,
      this.totalOnDuty})
      : _onDutyPersonnel = onDutyPersonnel,
        _todayShifts = todayShifts;

  factory _$DutyDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DutyDataImplFromJson(json);

  @override
  final String? date;
  @override
  final String? day;
  @override
  final MyDuty? myDuty;
  final List<dynamic>? _onDutyPersonnel;
  @override
  List<dynamic>? get onDutyPersonnel {
    final value = _onDutyPersonnel;
    if (value == null) return null;
    if (_onDutyPersonnel is EqualUnmodifiableListView) return _onDutyPersonnel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TodayShift>? _todayShifts;
  @override
  List<TodayShift>? get todayShifts {
    final value = _todayShifts;
    if (value == null) return null;
    if (_todayShifts is EqualUnmodifiableListView) return _todayShifts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? totalOnDuty;

  @override
  String toString() {
    return 'DutyData(date: $date, day: $day, myDuty: $myDuty, onDutyPersonnel: $onDutyPersonnel, todayShifts: $todayShifts, totalOnDuty: $totalOnDuty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DutyDataImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.myDuty, myDuty) || other.myDuty == myDuty) &&
            const DeepCollectionEquality()
                .equals(other._onDutyPersonnel, _onDutyPersonnel) &&
            const DeepCollectionEquality()
                .equals(other._todayShifts, _todayShifts) &&
            (identical(other.totalOnDuty, totalOnDuty) ||
                other.totalOnDuty == totalOnDuty));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      day,
      myDuty,
      const DeepCollectionEquality().hash(_onDutyPersonnel),
      const DeepCollectionEquality().hash(_todayShifts),
      totalOnDuty);

  /// Create a copy of DutyData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DutyDataImplCopyWith<_$DutyDataImpl> get copyWith =>
      __$$DutyDataImplCopyWithImpl<_$DutyDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DutyDataImplToJson(
      this,
    );
  }
}

abstract class _DutyData implements DutyData {
  const factory _DutyData(
      {final String? date,
      final String? day,
      final MyDuty? myDuty,
      final List<dynamic>? onDutyPersonnel,
      final List<TodayShift>? todayShifts,
      final int? totalOnDuty}) = _$DutyDataImpl;

  factory _DutyData.fromJson(Map<String, dynamic> json) =
      _$DutyDataImpl.fromJson;

  @override
  String? get date;
  @override
  String? get day;
  @override
  MyDuty? get myDuty;
  @override
  List<dynamic>? get onDutyPersonnel;
  @override
  List<TodayShift>? get todayShifts;
  @override
  int? get totalOnDuty;

  /// Create a copy of DutyData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DutyDataImplCopyWith<_$DutyDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
