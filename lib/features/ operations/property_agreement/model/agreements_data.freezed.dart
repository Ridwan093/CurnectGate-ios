// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agreements_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AgreementsData _$AgreementsDataFromJson(Map<String, dynamic> json) {
  return _AgreementsData.fromJson(json);
}

/// @nodoc
mixin _$AgreementsData {
  AgreementsContainer? get agreements => throw _privateConstructorUsedError;
  bool? get needsAction => throw _privateConstructorUsedError;
  List<String>? get requiredActions => throw _privateConstructorUsedError;
  UserInfo? get userInfo => throw _privateConstructorUsedError;

  /// Serializes this AgreementsData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AgreementsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgreementsDataCopyWith<AgreementsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgreementsDataCopyWith<$Res> {
  factory $AgreementsDataCopyWith(
          AgreementsData value, $Res Function(AgreementsData) then) =
      _$AgreementsDataCopyWithImpl<$Res, AgreementsData>;
  @useResult
  $Res call(
      {AgreementsContainer? agreements,
      bool? needsAction,
      List<String>? requiredActions,
      UserInfo? userInfo});

  $AgreementsContainerCopyWith<$Res>? get agreements;
  $UserInfoCopyWith<$Res>? get userInfo;
}

/// @nodoc
class _$AgreementsDataCopyWithImpl<$Res, $Val extends AgreementsData>
    implements $AgreementsDataCopyWith<$Res> {
  _$AgreementsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgreementsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agreements = freezed,
    Object? needsAction = freezed,
    Object? requiredActions = freezed,
    Object? userInfo = freezed,
  }) {
    return _then(_value.copyWith(
      agreements: freezed == agreements
          ? _value.agreements
          : agreements // ignore: cast_nullable_to_non_nullable
              as AgreementsContainer?,
      needsAction: freezed == needsAction
          ? _value.needsAction
          : needsAction // ignore: cast_nullable_to_non_nullable
              as bool?,
      requiredActions: freezed == requiredActions
          ? _value.requiredActions
          : requiredActions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      userInfo: freezed == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo?,
    ) as $Val);
  }

  /// Create a copy of AgreementsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AgreementsContainerCopyWith<$Res>? get agreements {
    if (_value.agreements == null) {
      return null;
    }

    return $AgreementsContainerCopyWith<$Res>(_value.agreements!, (value) {
      return _then(_value.copyWith(agreements: value) as $Val);
    });
  }

  /// Create a copy of AgreementsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserInfoCopyWith<$Res>? get userInfo {
    if (_value.userInfo == null) {
      return null;
    }

    return $UserInfoCopyWith<$Res>(_value.userInfo!, (value) {
      return _then(_value.copyWith(userInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AgreementsDataImplCopyWith<$Res>
    implements $AgreementsDataCopyWith<$Res> {
  factory _$$AgreementsDataImplCopyWith(_$AgreementsDataImpl value,
          $Res Function(_$AgreementsDataImpl) then) =
      __$$AgreementsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AgreementsContainer? agreements,
      bool? needsAction,
      List<String>? requiredActions,
      UserInfo? userInfo});

  @override
  $AgreementsContainerCopyWith<$Res>? get agreements;
  @override
  $UserInfoCopyWith<$Res>? get userInfo;
}

/// @nodoc
class __$$AgreementsDataImplCopyWithImpl<$Res>
    extends _$AgreementsDataCopyWithImpl<$Res, _$AgreementsDataImpl>
    implements _$$AgreementsDataImplCopyWith<$Res> {
  __$$AgreementsDataImplCopyWithImpl(
      _$AgreementsDataImpl _value, $Res Function(_$AgreementsDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AgreementsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agreements = freezed,
    Object? needsAction = freezed,
    Object? requiredActions = freezed,
    Object? userInfo = freezed,
  }) {
    return _then(_$AgreementsDataImpl(
      agreements: freezed == agreements
          ? _value.agreements
          : agreements // ignore: cast_nullable_to_non_nullable
              as AgreementsContainer?,
      needsAction: freezed == needsAction
          ? _value.needsAction
          : needsAction // ignore: cast_nullable_to_non_nullable
              as bool?,
      requiredActions: freezed == requiredActions
          ? _value._requiredActions
          : requiredActions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      userInfo: freezed == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$AgreementsDataImpl implements _AgreementsData {
  const _$AgreementsDataImpl(
      {this.agreements,
      this.needsAction,
      final List<String>? requiredActions,
      this.userInfo})
      : _requiredActions = requiredActions;

  factory _$AgreementsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgreementsDataImplFromJson(json);

  @override
  final AgreementsContainer? agreements;
  @override
  final bool? needsAction;
  final List<String>? _requiredActions;
  @override
  List<String>? get requiredActions {
    final value = _requiredActions;
    if (value == null) return null;
    if (_requiredActions is EqualUnmodifiableListView) return _requiredActions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final UserInfo? userInfo;

  @override
  String toString() {
    return 'AgreementsData(agreements: $agreements, needsAction: $needsAction, requiredActions: $requiredActions, userInfo: $userInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgreementsDataImpl &&
            (identical(other.agreements, agreements) ||
                other.agreements == agreements) &&
            (identical(other.needsAction, needsAction) ||
                other.needsAction == needsAction) &&
            const DeepCollectionEquality()
                .equals(other._requiredActions, _requiredActions) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, agreements, needsAction,
      const DeepCollectionEquality().hash(_requiredActions), userInfo);

  /// Create a copy of AgreementsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgreementsDataImplCopyWith<_$AgreementsDataImpl> get copyWith =>
      __$$AgreementsDataImplCopyWithImpl<_$AgreementsDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgreementsDataImplToJson(
      this,
    );
  }
}

abstract class _AgreementsData implements AgreementsData {
  const factory _AgreementsData(
      {final AgreementsContainer? agreements,
      final bool? needsAction,
      final List<String>? requiredActions,
      final UserInfo? userInfo}) = _$AgreementsDataImpl;

  factory _AgreementsData.fromJson(Map<String, dynamic> json) =
      _$AgreementsDataImpl.fromJson;

  @override
  AgreementsContainer? get agreements;
  @override
  bool? get needsAction;
  @override
  List<String>? get requiredActions;
  @override
  UserInfo? get userInfo;

  /// Create a copy of AgreementsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgreementsDataImplCopyWith<_$AgreementsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
