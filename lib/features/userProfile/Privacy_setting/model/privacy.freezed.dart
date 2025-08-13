// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'privacy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Privacy _$PrivacyFromJson(Map<String, dynamic> json) {
  return _Privacy.fromJson(json);
}

/// @nodoc
mixin _$Privacy {
  @JsonKey(name: 'show_email')
  ProfileVisibility? get showEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'show_phone')
  ProfileVisibility? get showPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_visibility')
  ProfileVisibility? get profileVisibility =>
      throw _privateConstructorUsedError;

  /// Serializes this Privacy to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Privacy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrivacyCopyWith<Privacy> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivacyCopyWith<$Res> {
  factory $PrivacyCopyWith(Privacy value, $Res Function(Privacy) then) =
      _$PrivacyCopyWithImpl<$Res, Privacy>;
  @useResult
  $Res call(
      {@JsonKey(name: 'show_email') ProfileVisibility? showEmail,
      @JsonKey(name: 'show_phone') ProfileVisibility? showPhone,
      @JsonKey(name: 'profile_visibility')
      ProfileVisibility? profileVisibility});

  $ProfileVisibilityCopyWith<$Res>? get showEmail;
  $ProfileVisibilityCopyWith<$Res>? get showPhone;
  $ProfileVisibilityCopyWith<$Res>? get profileVisibility;
}

/// @nodoc
class _$PrivacyCopyWithImpl<$Res, $Val extends Privacy>
    implements $PrivacyCopyWith<$Res> {
  _$PrivacyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Privacy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showEmail = freezed,
    Object? showPhone = freezed,
    Object? profileVisibility = freezed,
  }) {
    return _then(_value.copyWith(
      showEmail: freezed == showEmail
          ? _value.showEmail
          : showEmail // ignore: cast_nullable_to_non_nullable
              as ProfileVisibility?,
      showPhone: freezed == showPhone
          ? _value.showPhone
          : showPhone // ignore: cast_nullable_to_non_nullable
              as ProfileVisibility?,
      profileVisibility: freezed == profileVisibility
          ? _value.profileVisibility
          : profileVisibility // ignore: cast_nullable_to_non_nullable
              as ProfileVisibility?,
    ) as $Val);
  }

  /// Create a copy of Privacy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileVisibilityCopyWith<$Res>? get showEmail {
    if (_value.showEmail == null) {
      return null;
    }

    return $ProfileVisibilityCopyWith<$Res>(_value.showEmail!, (value) {
      return _then(_value.copyWith(showEmail: value) as $Val);
    });
  }

  /// Create a copy of Privacy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileVisibilityCopyWith<$Res>? get showPhone {
    if (_value.showPhone == null) {
      return null;
    }

    return $ProfileVisibilityCopyWith<$Res>(_value.showPhone!, (value) {
      return _then(_value.copyWith(showPhone: value) as $Val);
    });
  }

  /// Create a copy of Privacy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileVisibilityCopyWith<$Res>? get profileVisibility {
    if (_value.profileVisibility == null) {
      return null;
    }

    return $ProfileVisibilityCopyWith<$Res>(_value.profileVisibility!, (value) {
      return _then(_value.copyWith(profileVisibility: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PrivacyImplCopyWith<$Res> implements $PrivacyCopyWith<$Res> {
  factory _$$PrivacyImplCopyWith(
          _$PrivacyImpl value, $Res Function(_$PrivacyImpl) then) =
      __$$PrivacyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'show_email') ProfileVisibility? showEmail,
      @JsonKey(name: 'show_phone') ProfileVisibility? showPhone,
      @JsonKey(name: 'profile_visibility')
      ProfileVisibility? profileVisibility});

  @override
  $ProfileVisibilityCopyWith<$Res>? get showEmail;
  @override
  $ProfileVisibilityCopyWith<$Res>? get showPhone;
  @override
  $ProfileVisibilityCopyWith<$Res>? get profileVisibility;
}

/// @nodoc
class __$$PrivacyImplCopyWithImpl<$Res>
    extends _$PrivacyCopyWithImpl<$Res, _$PrivacyImpl>
    implements _$$PrivacyImplCopyWith<$Res> {
  __$$PrivacyImplCopyWithImpl(
      _$PrivacyImpl _value, $Res Function(_$PrivacyImpl) _then)
      : super(_value, _then);

  /// Create a copy of Privacy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showEmail = freezed,
    Object? showPhone = freezed,
    Object? profileVisibility = freezed,
  }) {
    return _then(_$PrivacyImpl(
      showEmail: freezed == showEmail
          ? _value.showEmail
          : showEmail // ignore: cast_nullable_to_non_nullable
              as ProfileVisibility?,
      showPhone: freezed == showPhone
          ? _value.showPhone
          : showPhone // ignore: cast_nullable_to_non_nullable
              as ProfileVisibility?,
      profileVisibility: freezed == profileVisibility
          ? _value.profileVisibility
          : profileVisibility // ignore: cast_nullable_to_non_nullable
              as ProfileVisibility?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PrivacyImpl implements _Privacy {
  const _$PrivacyImpl(
      {@JsonKey(name: 'show_email') this.showEmail,
      @JsonKey(name: 'show_phone') this.showPhone,
      @JsonKey(name: 'profile_visibility') this.profileVisibility});

  factory _$PrivacyImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrivacyImplFromJson(json);

  @override
  @JsonKey(name: 'show_email')
  final ProfileVisibility? showEmail;
  @override
  @JsonKey(name: 'show_phone')
  final ProfileVisibility? showPhone;
  @override
  @JsonKey(name: 'profile_visibility')
  final ProfileVisibility? profileVisibility;

  @override
  String toString() {
    return 'Privacy(showEmail: $showEmail, showPhone: $showPhone, profileVisibility: $profileVisibility)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivacyImpl &&
            (identical(other.showEmail, showEmail) ||
                other.showEmail == showEmail) &&
            (identical(other.showPhone, showPhone) ||
                other.showPhone == showPhone) &&
            (identical(other.profileVisibility, profileVisibility) ||
                other.profileVisibility == profileVisibility));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, showEmail, showPhone, profileVisibility);

  /// Create a copy of Privacy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivacyImplCopyWith<_$PrivacyImpl> get copyWith =>
      __$$PrivacyImplCopyWithImpl<_$PrivacyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivacyImplToJson(
      this,
    );
  }
}

abstract class _Privacy implements Privacy {
  const factory _Privacy(
      {@JsonKey(name: 'show_email') final ProfileVisibility? showEmail,
      @JsonKey(name: 'show_phone') final ProfileVisibility? showPhone,
      @JsonKey(name: 'profile_visibility')
      final ProfileVisibility? profileVisibility}) = _$PrivacyImpl;

  factory _Privacy.fromJson(Map<String, dynamic> json) = _$PrivacyImpl.fromJson;

  @override
  @JsonKey(name: 'show_email')
  ProfileVisibility? get showEmail;
  @override
  @JsonKey(name: 'show_phone')
  ProfileVisibility? get showPhone;
  @override
  @JsonKey(name: 'profile_visibility')
  ProfileVisibility? get profileVisibility;

  /// Create a copy of Privacy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrivacyImplCopyWith<_$PrivacyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
