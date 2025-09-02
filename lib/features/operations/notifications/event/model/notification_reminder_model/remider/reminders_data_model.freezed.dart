// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminders_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RemindersData _$RemindersDataFromJson(Map<String, dynamic> json) {
  return _RemindersData.fromJson(json);
}

/// @nodoc
mixin _$RemindersData {
  List<ReminderModel>? get reminders => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;

  /// Serializes this RemindersData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RemindersData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RemindersDataCopyWith<RemindersData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemindersDataCopyWith<$Res> {
  factory $RemindersDataCopyWith(
          RemindersData value, $Res Function(RemindersData) then) =
      _$RemindersDataCopyWithImpl<$Res, RemindersData>;
  @useResult
  $Res call({List<ReminderModel>? reminders, int? count});
}

/// @nodoc
class _$RemindersDataCopyWithImpl<$Res, $Val extends RemindersData>
    implements $RemindersDataCopyWith<$Res> {
  _$RemindersDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RemindersData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reminders = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      reminders: freezed == reminders
          ? _value.reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as List<ReminderModel>?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemindersDataImplCopyWith<$Res>
    implements $RemindersDataCopyWith<$Res> {
  factory _$$RemindersDataImplCopyWith(
          _$RemindersDataImpl value, $Res Function(_$RemindersDataImpl) then) =
      __$$RemindersDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ReminderModel>? reminders, int? count});
}

/// @nodoc
class __$$RemindersDataImplCopyWithImpl<$Res>
    extends _$RemindersDataCopyWithImpl<$Res, _$RemindersDataImpl>
    implements _$$RemindersDataImplCopyWith<$Res> {
  __$$RemindersDataImplCopyWithImpl(
      _$RemindersDataImpl _value, $Res Function(_$RemindersDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemindersData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reminders = freezed,
    Object? count = freezed,
  }) {
    return _then(_$RemindersDataImpl(
      reminders: freezed == reminders
          ? _value._reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as List<ReminderModel>?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$RemindersDataImpl implements _RemindersData {
  const _$RemindersDataImpl({final List<ReminderModel>? reminders, this.count})
      : _reminders = reminders;

  factory _$RemindersDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemindersDataImplFromJson(json);

  final List<ReminderModel>? _reminders;
  @override
  List<ReminderModel>? get reminders {
    final value = _reminders;
    if (value == null) return null;
    if (_reminders is EqualUnmodifiableListView) return _reminders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? count;

  @override
  String toString() {
    return 'RemindersData(reminders: $reminders, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemindersDataImpl &&
            const DeepCollectionEquality()
                .equals(other._reminders, _reminders) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_reminders), count);

  /// Create a copy of RemindersData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemindersDataImplCopyWith<_$RemindersDataImpl> get copyWith =>
      __$$RemindersDataImplCopyWithImpl<_$RemindersDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemindersDataImplToJson(
      this,
    );
  }
}

abstract class _RemindersData implements RemindersData {
  const factory _RemindersData(
      {final List<ReminderModel>? reminders,
      final int? count}) = _$RemindersDataImpl;

  factory _RemindersData.fromJson(Map<String, dynamic> json) =
      _$RemindersDataImpl.fromJson;

  @override
  List<ReminderModel>? get reminders;
  @override
  int? get count;

  /// Create a copy of RemindersData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemindersDataImplCopyWith<_$RemindersDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
