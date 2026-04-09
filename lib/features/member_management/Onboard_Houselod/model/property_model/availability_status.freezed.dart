// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'availability_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AvailabilityStatus _$AvailabilityStatusFromJson(Map<String, dynamic> json) {
  return _AvailabilityStatus.fromJson(json);
}

/// @nodoc
mixin _$AvailabilityStatus {
  @JsonKey(name: 'is_available')
  bool get isAvailable => throw _privateConstructorUsedError;
  @JsonKey(name: 'reason')
  String? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'available_from')
  String? get availableFrom => throw _privateConstructorUsedError;

  /// Serializes this AvailabilityStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AvailabilityStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvailabilityStatusCopyWith<AvailabilityStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailabilityStatusCopyWith<$Res> {
  factory $AvailabilityStatusCopyWith(
          AvailabilityStatus value, $Res Function(AvailabilityStatus) then) =
      _$AvailabilityStatusCopyWithImpl<$Res, AvailabilityStatus>;
  @useResult
  $Res call(
      {@JsonKey(name: 'is_available') bool isAvailable,
      @JsonKey(name: 'reason') String? reason,
      @JsonKey(name: 'available_from') String? availableFrom});
}

/// @nodoc
class _$AvailabilityStatusCopyWithImpl<$Res, $Val extends AvailabilityStatus>
    implements $AvailabilityStatusCopyWith<$Res> {
  _$AvailabilityStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvailabilityStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAvailable = null,
    Object? reason = freezed,
    Object? availableFrom = freezed,
  }) {
    return _then(_value.copyWith(
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      availableFrom: freezed == availableFrom
          ? _value.availableFrom
          : availableFrom // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvailabilityStatusImplCopyWith<$Res>
    implements $AvailabilityStatusCopyWith<$Res> {
  factory _$$AvailabilityStatusImplCopyWith(_$AvailabilityStatusImpl value,
          $Res Function(_$AvailabilityStatusImpl) then) =
      __$$AvailabilityStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'is_available') bool isAvailable,
      @JsonKey(name: 'reason') String? reason,
      @JsonKey(name: 'available_from') String? availableFrom});
}

/// @nodoc
class __$$AvailabilityStatusImplCopyWithImpl<$Res>
    extends _$AvailabilityStatusCopyWithImpl<$Res, _$AvailabilityStatusImpl>
    implements _$$AvailabilityStatusImplCopyWith<$Res> {
  __$$AvailabilityStatusImplCopyWithImpl(_$AvailabilityStatusImpl _value,
      $Res Function(_$AvailabilityStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of AvailabilityStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAvailable = null,
    Object? reason = freezed,
    Object? availableFrom = freezed,
  }) {
    return _then(_$AvailabilityStatusImpl(
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      availableFrom: freezed == availableFrom
          ? _value.availableFrom
          : availableFrom // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$AvailabilityStatusImpl implements _AvailabilityStatus {
  const _$AvailabilityStatusImpl(
      {@JsonKey(name: 'is_available') this.isAvailable = false,
      @JsonKey(name: 'reason') this.reason,
      @JsonKey(name: 'available_from') this.availableFrom});

  factory _$AvailabilityStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvailabilityStatusImplFromJson(json);

  @override
  @JsonKey(name: 'is_available')
  final bool isAvailable;
  @override
  @JsonKey(name: 'reason')
  final String? reason;
  @override
  @JsonKey(name: 'available_from')
  final String? availableFrom;

  @override
  String toString() {
    return 'AvailabilityStatus(isAvailable: $isAvailable, reason: $reason, availableFrom: $availableFrom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailabilityStatusImpl &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.availableFrom, availableFrom) ||
                other.availableFrom == availableFrom));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isAvailable, reason, availableFrom);

  /// Create a copy of AvailabilityStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailabilityStatusImplCopyWith<_$AvailabilityStatusImpl> get copyWith =>
      __$$AvailabilityStatusImplCopyWithImpl<_$AvailabilityStatusImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvailabilityStatusImplToJson(
      this,
    );
  }
}

abstract class _AvailabilityStatus implements AvailabilityStatus {
  const factory _AvailabilityStatus(
          {@JsonKey(name: 'is_available') final bool isAvailable,
          @JsonKey(name: 'reason') final String? reason,
          @JsonKey(name: 'available_from') final String? availableFrom}) =
      _$AvailabilityStatusImpl;

  factory _AvailabilityStatus.fromJson(Map<String, dynamic> json) =
      _$AvailabilityStatusImpl.fromJson;

  @override
  @JsonKey(name: 'is_available')
  bool get isAvailable;
  @override
  @JsonKey(name: 'reason')
  String? get reason;
  @override
  @JsonKey(name: 'available_from')
  String? get availableFrom;

  /// Create a copy of AvailabilityStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvailabilityStatusImplCopyWith<_$AvailabilityStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
