// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Preferences _$PreferencesFromJson(Map<String, dynamic> json) {
  return _Preferences.fromJson(json);
}

/// @nodoc
mixin _$Preferences {
  Preference? get currency => throw _privateConstructorUsedError;
  Preference? get language => throw _privateConstructorUsedError;
  Preference? get timezone => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_format')
  Preference? get dateFormat => throw _privateConstructorUsedError;

  /// Serializes this Preferences to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Preferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PreferencesCopyWith<Preferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferencesCopyWith<$Res> {
  factory $PreferencesCopyWith(
          Preferences value, $Res Function(Preferences) then) =
      _$PreferencesCopyWithImpl<$Res, Preferences>;
  @useResult
  $Res call(
      {Preference? currency,
      Preference? language,
      Preference? timezone,
      @JsonKey(name: 'date_format') Preference? dateFormat});

  $PreferenceCopyWith<$Res>? get currency;
  $PreferenceCopyWith<$Res>? get language;
  $PreferenceCopyWith<$Res>? get timezone;
  $PreferenceCopyWith<$Res>? get dateFormat;
}

/// @nodoc
class _$PreferencesCopyWithImpl<$Res, $Val extends Preferences>
    implements $PreferencesCopyWith<$Res> {
  _$PreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Preferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = freezed,
    Object? language = freezed,
    Object? timezone = freezed,
    Object? dateFormat = freezed,
  }) {
    return _then(_value.copyWith(
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Preference?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Preference?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as Preference?,
      dateFormat: freezed == dateFormat
          ? _value.dateFormat
          : dateFormat // ignore: cast_nullable_to_non_nullable
              as Preference?,
    ) as $Val);
  }

  /// Create a copy of Preferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PreferenceCopyWith<$Res>? get currency {
    if (_value.currency == null) {
      return null;
    }

    return $PreferenceCopyWith<$Res>(_value.currency!, (value) {
      return _then(_value.copyWith(currency: value) as $Val);
    });
  }

  /// Create a copy of Preferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PreferenceCopyWith<$Res>? get language {
    if (_value.language == null) {
      return null;
    }

    return $PreferenceCopyWith<$Res>(_value.language!, (value) {
      return _then(_value.copyWith(language: value) as $Val);
    });
  }

  /// Create a copy of Preferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PreferenceCopyWith<$Res>? get timezone {
    if (_value.timezone == null) {
      return null;
    }

    return $PreferenceCopyWith<$Res>(_value.timezone!, (value) {
      return _then(_value.copyWith(timezone: value) as $Val);
    });
  }

  /// Create a copy of Preferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PreferenceCopyWith<$Res>? get dateFormat {
    if (_value.dateFormat == null) {
      return null;
    }

    return $PreferenceCopyWith<$Res>(_value.dateFormat!, (value) {
      return _then(_value.copyWith(dateFormat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PreferencesImplCopyWith<$Res>
    implements $PreferencesCopyWith<$Res> {
  factory _$$PreferencesImplCopyWith(
          _$PreferencesImpl value, $Res Function(_$PreferencesImpl) then) =
      __$$PreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Preference? currency,
      Preference? language,
      Preference? timezone,
      @JsonKey(name: 'date_format') Preference? dateFormat});

  @override
  $PreferenceCopyWith<$Res>? get currency;
  @override
  $PreferenceCopyWith<$Res>? get language;
  @override
  $PreferenceCopyWith<$Res>? get timezone;
  @override
  $PreferenceCopyWith<$Res>? get dateFormat;
}

/// @nodoc
class __$$PreferencesImplCopyWithImpl<$Res>
    extends _$PreferencesCopyWithImpl<$Res, _$PreferencesImpl>
    implements _$$PreferencesImplCopyWith<$Res> {
  __$$PreferencesImplCopyWithImpl(
      _$PreferencesImpl _value, $Res Function(_$PreferencesImpl) _then)
      : super(_value, _then);

  /// Create a copy of Preferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = freezed,
    Object? language = freezed,
    Object? timezone = freezed,
    Object? dateFormat = freezed,
  }) {
    return _then(_$PreferencesImpl(
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Preference?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Preference?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as Preference?,
      dateFormat: freezed == dateFormat
          ? _value.dateFormat
          : dateFormat // ignore: cast_nullable_to_non_nullable
              as Preference?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PreferencesImpl implements _Preferences {
  const _$PreferencesImpl(
      {this.currency,
      this.language,
      this.timezone,
      @JsonKey(name: 'date_format') this.dateFormat});

  factory _$PreferencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreferencesImplFromJson(json);

  @override
  final Preference? currency;
  @override
  final Preference? language;
  @override
  final Preference? timezone;
  @override
  @JsonKey(name: 'date_format')
  final Preference? dateFormat;

  @override
  String toString() {
    return 'Preferences(currency: $currency, language: $language, timezone: $timezone, dateFormat: $dateFormat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreferencesImpl &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.dateFormat, dateFormat) ||
                other.dateFormat == dateFormat));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currency, language, timezone, dateFormat);

  /// Create a copy of Preferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PreferencesImplCopyWith<_$PreferencesImpl> get copyWith =>
      __$$PreferencesImplCopyWithImpl<_$PreferencesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PreferencesImplToJson(
      this,
    );
  }
}

abstract class _Preferences implements Preferences {
  const factory _Preferences(
          {final Preference? currency,
          final Preference? language,
          final Preference? timezone,
          @JsonKey(name: 'date_format') final Preference? dateFormat}) =
      _$PreferencesImpl;

  factory _Preferences.fromJson(Map<String, dynamic> json) =
      _$PreferencesImpl.fromJson;

  @override
  Preference? get currency;
  @override
  Preference? get language;
  @override
  Preference? get timezone;
  @override
  @JsonKey(name: 'date_format')
  Preference? get dateFormat;

  /// Create a copy of Preferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PreferencesImplCopyWith<_$PreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
