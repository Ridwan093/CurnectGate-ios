// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operating_hours.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OperatingHours _$OperatingHoursFromJson(Map<String, dynamic> json) {
  return _OperatingHours.fromJson(json);
}

/// @nodoc
mixin _$OperatingHours {
  @JsonKey(name: 'gate_open')
  String? get gateOpen => throw _privateConstructorUsedError;
  @JsonKey(name: 'gate_close')
  String? get gateClose => throw _privateConstructorUsedError;

  /// Serializes this OperatingHours to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OperatingHours
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OperatingHoursCopyWith<OperatingHours> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperatingHoursCopyWith<$Res> {
  factory $OperatingHoursCopyWith(
          OperatingHours value, $Res Function(OperatingHours) then) =
      _$OperatingHoursCopyWithImpl<$Res, OperatingHours>;
  @useResult
  $Res call(
      {@JsonKey(name: 'gate_open') String? gateOpen,
      @JsonKey(name: 'gate_close') String? gateClose});
}

/// @nodoc
class _$OperatingHoursCopyWithImpl<$Res, $Val extends OperatingHours>
    implements $OperatingHoursCopyWith<$Res> {
  _$OperatingHoursCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OperatingHours
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gateOpen = freezed,
    Object? gateClose = freezed,
  }) {
    return _then(_value.copyWith(
      gateOpen: freezed == gateOpen
          ? _value.gateOpen
          : gateOpen // ignore: cast_nullable_to_non_nullable
              as String?,
      gateClose: freezed == gateClose
          ? _value.gateClose
          : gateClose // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OperatingHoursImplCopyWith<$Res>
    implements $OperatingHoursCopyWith<$Res> {
  factory _$$OperatingHoursImplCopyWith(_$OperatingHoursImpl value,
          $Res Function(_$OperatingHoursImpl) then) =
      __$$OperatingHoursImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'gate_open') String? gateOpen,
      @JsonKey(name: 'gate_close') String? gateClose});
}

/// @nodoc
class __$$OperatingHoursImplCopyWithImpl<$Res>
    extends _$OperatingHoursCopyWithImpl<$Res, _$OperatingHoursImpl>
    implements _$$OperatingHoursImplCopyWith<$Res> {
  __$$OperatingHoursImplCopyWithImpl(
      _$OperatingHoursImpl _value, $Res Function(_$OperatingHoursImpl) _then)
      : super(_value, _then);

  /// Create a copy of OperatingHours
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gateOpen = freezed,
    Object? gateClose = freezed,
  }) {
    return _then(_$OperatingHoursImpl(
      gateOpen: freezed == gateOpen
          ? _value.gateOpen
          : gateOpen // ignore: cast_nullable_to_non_nullable
              as String?,
      gateClose: freezed == gateClose
          ? _value.gateClose
          : gateClose // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$OperatingHoursImpl implements _OperatingHours {
  const _$OperatingHoursImpl(
      {@JsonKey(name: 'gate_open') this.gateOpen,
      @JsonKey(name: 'gate_close') this.gateClose});

  factory _$OperatingHoursImpl.fromJson(Map<String, dynamic> json) =>
      _$$OperatingHoursImplFromJson(json);

  @override
  @JsonKey(name: 'gate_open')
  final String? gateOpen;
  @override
  @JsonKey(name: 'gate_close')
  final String? gateClose;

  @override
  String toString() {
    return 'OperatingHours(gateOpen: $gateOpen, gateClose: $gateClose)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperatingHoursImpl &&
            (identical(other.gateOpen, gateOpen) ||
                other.gateOpen == gateOpen) &&
            (identical(other.gateClose, gateClose) ||
                other.gateClose == gateClose));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, gateOpen, gateClose);

  /// Create a copy of OperatingHours
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OperatingHoursImplCopyWith<_$OperatingHoursImpl> get copyWith =>
      __$$OperatingHoursImplCopyWithImpl<_$OperatingHoursImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OperatingHoursImplToJson(
      this,
    );
  }
}

abstract class _OperatingHours implements OperatingHours {
  const factory _OperatingHours(
          {@JsonKey(name: 'gate_open') final String? gateOpen,
          @JsonKey(name: 'gate_close') final String? gateClose}) =
      _$OperatingHoursImpl;

  factory _OperatingHours.fromJson(Map<String, dynamic> json) =
      _$OperatingHoursImpl.fromJson;

  @override
  @JsonKey(name: 'gate_open')
  String? get gateOpen;
  @override
  @JsonKey(name: 'gate_close')
  String? get gateClose;

  /// Create a copy of OperatingHours
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OperatingHoursImplCopyWith<_$OperatingHoursImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
