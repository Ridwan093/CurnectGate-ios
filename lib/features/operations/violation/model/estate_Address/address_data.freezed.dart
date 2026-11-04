// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddressData _$AddressDataFromJson(Map<String, dynamic> json) {
  return _AddressData.fromJson(json);
}

/// @nodoc
mixin _$AddressData {
  List<EstateAddress>? get addresses => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;

  /// Serializes this AddressData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddressData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressDataCopyWith<AddressData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressDataCopyWith<$Res> {
  factory $AddressDataCopyWith(
          AddressData value, $Res Function(AddressData) then) =
      _$AddressDataCopyWithImpl<$Res, AddressData>;
  @useResult
  $Res call({List<EstateAddress>? addresses, int? total});
}

/// @nodoc
class _$AddressDataCopyWithImpl<$Res, $Val extends AddressData>
    implements $AddressDataCopyWith<$Res> {
  _$AddressDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddressData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addresses = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      addresses: freezed == addresses
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<EstateAddress>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressDataImplCopyWith<$Res>
    implements $AddressDataCopyWith<$Res> {
  factory _$$AddressDataImplCopyWith(
          _$AddressDataImpl value, $Res Function(_$AddressDataImpl) then) =
      __$$AddressDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<EstateAddress>? addresses, int? total});
}

/// @nodoc
class __$$AddressDataImplCopyWithImpl<$Res>
    extends _$AddressDataCopyWithImpl<$Res, _$AddressDataImpl>
    implements _$$AddressDataImplCopyWith<$Res> {
  __$$AddressDataImplCopyWithImpl(
      _$AddressDataImpl _value, $Res Function(_$AddressDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddressData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addresses = freezed,
    Object? total = freezed,
  }) {
    return _then(_$AddressDataImpl(
      addresses: freezed == addresses
          ? _value._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<EstateAddress>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressDataImpl implements _AddressData {
  const _$AddressDataImpl({final List<EstateAddress>? addresses, this.total})
      : _addresses = addresses;

  factory _$AddressDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressDataImplFromJson(json);

  final List<EstateAddress>? _addresses;
  @override
  List<EstateAddress>? get addresses {
    final value = _addresses;
    if (value == null) return null;
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? total;

  @override
  String toString() {
    return 'AddressData(addresses: $addresses, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressDataImpl &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_addresses), total);

  /// Create a copy of AddressData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressDataImplCopyWith<_$AddressDataImpl> get copyWith =>
      __$$AddressDataImplCopyWithImpl<_$AddressDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressDataImplToJson(
      this,
    );
  }
}

abstract class _AddressData implements AddressData {
  const factory _AddressData(
      {final List<EstateAddress>? addresses,
      final int? total}) = _$AddressDataImpl;

  factory _AddressData.fromJson(Map<String, dynamic> json) =
      _$AddressDataImpl.fromJson;

  @override
  List<EstateAddress>? get addresses;
  @override
  int? get total;

  /// Create a copy of AddressData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressDataImplCopyWith<_$AddressDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
