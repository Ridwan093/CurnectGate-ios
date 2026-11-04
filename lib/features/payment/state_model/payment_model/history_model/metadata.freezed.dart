// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Metadata _$MetadataFromJson(Map<String, dynamic> json) {
  return _Metadata.fromJson(json);
}

/// @nodoc
mixin _$Metadata {
  int? get duesCount => throw _privateConstructorUsedError;
  List<ItemPaid>? get itemsPaid => throw _privateConstructorUsedError;
  String? get paymentType => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get callbackUrl => throw _privateConstructorUsedError;
  int? get walletFlowId => throw _privateConstructorUsedError;
  Map<String, dynamic>? get initializationData =>
      throw _privateConstructorUsedError;

  /// Serializes this Metadata to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Metadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetadataCopyWith<Metadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetadataCopyWith<$Res> {
  factory $MetadataCopyWith(Metadata value, $Res Function(Metadata) then) =
      _$MetadataCopyWithImpl<$Res, Metadata>;
  @useResult
  $Res call(
      {int? duesCount,
      List<ItemPaid>? itemsPaid,
      String? paymentType,
      String? email,
      String? callbackUrl,
      int? walletFlowId,
      Map<String, dynamic>? initializationData});
}

/// @nodoc
class _$MetadataCopyWithImpl<$Res, $Val extends Metadata>
    implements $MetadataCopyWith<$Res> {
  _$MetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Metadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duesCount = freezed,
    Object? itemsPaid = freezed,
    Object? paymentType = freezed,
    Object? email = freezed,
    Object? callbackUrl = freezed,
    Object? walletFlowId = freezed,
    Object? initializationData = freezed,
  }) {
    return _then(_value.copyWith(
      duesCount: freezed == duesCount
          ? _value.duesCount
          : duesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      itemsPaid: freezed == itemsPaid
          ? _value.itemsPaid
          : itemsPaid // ignore: cast_nullable_to_non_nullable
              as List<ItemPaid>?,
      paymentType: freezed == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      callbackUrl: freezed == callbackUrl
          ? _value.callbackUrl
          : callbackUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      walletFlowId: freezed == walletFlowId
          ? _value.walletFlowId
          : walletFlowId // ignore: cast_nullable_to_non_nullable
              as int?,
      initializationData: freezed == initializationData
          ? _value.initializationData
          : initializationData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetadataImplCopyWith<$Res>
    implements $MetadataCopyWith<$Res> {
  factory _$$MetadataImplCopyWith(
          _$MetadataImpl value, $Res Function(_$MetadataImpl) then) =
      __$$MetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? duesCount,
      List<ItemPaid>? itemsPaid,
      String? paymentType,
      String? email,
      String? callbackUrl,
      int? walletFlowId,
      Map<String, dynamic>? initializationData});
}

/// @nodoc
class __$$MetadataImplCopyWithImpl<$Res>
    extends _$MetadataCopyWithImpl<$Res, _$MetadataImpl>
    implements _$$MetadataImplCopyWith<$Res> {
  __$$MetadataImplCopyWithImpl(
      _$MetadataImpl _value, $Res Function(_$MetadataImpl) _then)
      : super(_value, _then);

  /// Create a copy of Metadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duesCount = freezed,
    Object? itemsPaid = freezed,
    Object? paymentType = freezed,
    Object? email = freezed,
    Object? callbackUrl = freezed,
    Object? walletFlowId = freezed,
    Object? initializationData = freezed,
  }) {
    return _then(_$MetadataImpl(
      duesCount: freezed == duesCount
          ? _value.duesCount
          : duesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      itemsPaid: freezed == itemsPaid
          ? _value._itemsPaid
          : itemsPaid // ignore: cast_nullable_to_non_nullable
              as List<ItemPaid>?,
      paymentType: freezed == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      callbackUrl: freezed == callbackUrl
          ? _value.callbackUrl
          : callbackUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      walletFlowId: freezed == walletFlowId
          ? _value.walletFlowId
          : walletFlowId // ignore: cast_nullable_to_non_nullable
              as int?,
      initializationData: freezed == initializationData
          ? _value._initializationData
          : initializationData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$MetadataImpl implements _Metadata {
  const _$MetadataImpl(
      {this.duesCount,
      final List<ItemPaid>? itemsPaid,
      this.paymentType,
      this.email,
      this.callbackUrl,
      this.walletFlowId,
      final Map<String, dynamic>? initializationData})
      : _itemsPaid = itemsPaid,
        _initializationData = initializationData;

  factory _$MetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetadataImplFromJson(json);

  @override
  final int? duesCount;
  final List<ItemPaid>? _itemsPaid;
  @override
  List<ItemPaid>? get itemsPaid {
    final value = _itemsPaid;
    if (value == null) return null;
    if (_itemsPaid is EqualUnmodifiableListView) return _itemsPaid;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? paymentType;
  @override
  final String? email;
  @override
  final String? callbackUrl;
  @override
  final int? walletFlowId;
  final Map<String, dynamic>? _initializationData;
  @override
  Map<String, dynamic>? get initializationData {
    final value = _initializationData;
    if (value == null) return null;
    if (_initializationData is EqualUnmodifiableMapView)
      return _initializationData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Metadata(duesCount: $duesCount, itemsPaid: $itemsPaid, paymentType: $paymentType, email: $email, callbackUrl: $callbackUrl, walletFlowId: $walletFlowId, initializationData: $initializationData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetadataImpl &&
            (identical(other.duesCount, duesCount) ||
                other.duesCount == duesCount) &&
            const DeepCollectionEquality()
                .equals(other._itemsPaid, _itemsPaid) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.callbackUrl, callbackUrl) ||
                other.callbackUrl == callbackUrl) &&
            (identical(other.walletFlowId, walletFlowId) ||
                other.walletFlowId == walletFlowId) &&
            const DeepCollectionEquality()
                .equals(other._initializationData, _initializationData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      duesCount,
      const DeepCollectionEquality().hash(_itemsPaid),
      paymentType,
      email,
      callbackUrl,
      walletFlowId,
      const DeepCollectionEquality().hash(_initializationData));

  /// Create a copy of Metadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetadataImplCopyWith<_$MetadataImpl> get copyWith =>
      __$$MetadataImplCopyWithImpl<_$MetadataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetadataImplToJson(
      this,
    );
  }
}

abstract class _Metadata implements Metadata {
  const factory _Metadata(
      {final int? duesCount,
      final List<ItemPaid>? itemsPaid,
      final String? paymentType,
      final String? email,
      final String? callbackUrl,
      final int? walletFlowId,
      final Map<String, dynamic>? initializationData}) = _$MetadataImpl;

  factory _Metadata.fromJson(Map<String, dynamic> json) =
      _$MetadataImpl.fromJson;

  @override
  int? get duesCount;
  @override
  List<ItemPaid>? get itemsPaid;
  @override
  String? get paymentType;
  @override
  String? get email;
  @override
  String? get callbackUrl;
  @override
  int? get walletFlowId;
  @override
  Map<String, dynamic>? get initializationData;

  /// Create a copy of Metadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetadataImplCopyWith<_$MetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
