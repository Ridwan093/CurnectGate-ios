// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Notifications _$NotificationsFromJson(Map<String, dynamic> json) {
  return _Notifications.fromJson(json);
}

/// @nodoc
mixin _$Notifications {
  Community? get email => throw _privateConstructorUsedError;
  Community? get sms => throw _privateConstructorUsedError;
  Community? get push => throw _privateConstructorUsedError;
  Community? get payments => throw _privateConstructorUsedError;
  Community? get security => throw _privateConstructorUsedError;
  Community? get community => throw _privateConstructorUsedError;
  Community? get maintenance => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_reminders')
  Community? get paymentReminders => throw _privateConstructorUsedError;
  @JsonKey(name: 'community_updates')
  Community? get communityUpdates => throw _privateConstructorUsedError;
  @JsonKey(name: 'maintenance_alerts')
  Community? get maintenanceAlerts => throw _privateConstructorUsedError;

  /// Serializes this Notifications to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationsCopyWith<Notifications> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsCopyWith<$Res> {
  factory $NotificationsCopyWith(
          Notifications value, $Res Function(Notifications) then) =
      _$NotificationsCopyWithImpl<$Res, Notifications>;
  @useResult
  $Res call(
      {Community? email,
      Community? sms,
      Community? push,
      Community? payments,
      Community? security,
      Community? community,
      Community? maintenance,
      @JsonKey(name: 'payment_reminders') Community? paymentReminders,
      @JsonKey(name: 'community_updates') Community? communityUpdates,
      @JsonKey(name: 'maintenance_alerts') Community? maintenanceAlerts});

  $CommunityCopyWith<$Res>? get email;
  $CommunityCopyWith<$Res>? get sms;
  $CommunityCopyWith<$Res>? get push;
  $CommunityCopyWith<$Res>? get payments;
  $CommunityCopyWith<$Res>? get security;
  $CommunityCopyWith<$Res>? get community;
  $CommunityCopyWith<$Res>? get maintenance;
  $CommunityCopyWith<$Res>? get paymentReminders;
  $CommunityCopyWith<$Res>? get communityUpdates;
  $CommunityCopyWith<$Res>? get maintenanceAlerts;
}

/// @nodoc
class _$NotificationsCopyWithImpl<$Res, $Val extends Notifications>
    implements $NotificationsCopyWith<$Res> {
  _$NotificationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? sms = freezed,
    Object? push = freezed,
    Object? payments = freezed,
    Object? security = freezed,
    Object? community = freezed,
    Object? maintenance = freezed,
    Object? paymentReminders = freezed,
    Object? communityUpdates = freezed,
    Object? maintenanceAlerts = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Community?,
      sms: freezed == sms
          ? _value.sms
          : sms // ignore: cast_nullable_to_non_nullable
              as Community?,
      push: freezed == push
          ? _value.push
          : push // ignore: cast_nullable_to_non_nullable
              as Community?,
      payments: freezed == payments
          ? _value.payments
          : payments // ignore: cast_nullable_to_non_nullable
              as Community?,
      security: freezed == security
          ? _value.security
          : security // ignore: cast_nullable_to_non_nullable
              as Community?,
      community: freezed == community
          ? _value.community
          : community // ignore: cast_nullable_to_non_nullable
              as Community?,
      maintenance: freezed == maintenance
          ? _value.maintenance
          : maintenance // ignore: cast_nullable_to_non_nullable
              as Community?,
      paymentReminders: freezed == paymentReminders
          ? _value.paymentReminders
          : paymentReminders // ignore: cast_nullable_to_non_nullable
              as Community?,
      communityUpdates: freezed == communityUpdates
          ? _value.communityUpdates
          : communityUpdates // ignore: cast_nullable_to_non_nullable
              as Community?,
      maintenanceAlerts: freezed == maintenanceAlerts
          ? _value.maintenanceAlerts
          : maintenanceAlerts // ignore: cast_nullable_to_non_nullable
              as Community?,
    ) as $Val);
  }

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommunityCopyWith<$Res>? get email {
    if (_value.email == null) {
      return null;
    }

    return $CommunityCopyWith<$Res>(_value.email!, (value) {
      return _then(_value.copyWith(email: value) as $Val);
    });
  }

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommunityCopyWith<$Res>? get sms {
    if (_value.sms == null) {
      return null;
    }

    return $CommunityCopyWith<$Res>(_value.sms!, (value) {
      return _then(_value.copyWith(sms: value) as $Val);
    });
  }

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommunityCopyWith<$Res>? get push {
    if (_value.push == null) {
      return null;
    }

    return $CommunityCopyWith<$Res>(_value.push!, (value) {
      return _then(_value.copyWith(push: value) as $Val);
    });
  }

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommunityCopyWith<$Res>? get payments {
    if (_value.payments == null) {
      return null;
    }

    return $CommunityCopyWith<$Res>(_value.payments!, (value) {
      return _then(_value.copyWith(payments: value) as $Val);
    });
  }

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommunityCopyWith<$Res>? get security {
    if (_value.security == null) {
      return null;
    }

    return $CommunityCopyWith<$Res>(_value.security!, (value) {
      return _then(_value.copyWith(security: value) as $Val);
    });
  }

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommunityCopyWith<$Res>? get community {
    if (_value.community == null) {
      return null;
    }

    return $CommunityCopyWith<$Res>(_value.community!, (value) {
      return _then(_value.copyWith(community: value) as $Val);
    });
  }

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommunityCopyWith<$Res>? get maintenance {
    if (_value.maintenance == null) {
      return null;
    }

    return $CommunityCopyWith<$Res>(_value.maintenance!, (value) {
      return _then(_value.copyWith(maintenance: value) as $Val);
    });
  }

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommunityCopyWith<$Res>? get paymentReminders {
    if (_value.paymentReminders == null) {
      return null;
    }

    return $CommunityCopyWith<$Res>(_value.paymentReminders!, (value) {
      return _then(_value.copyWith(paymentReminders: value) as $Val);
    });
  }

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommunityCopyWith<$Res>? get communityUpdates {
    if (_value.communityUpdates == null) {
      return null;
    }

    return $CommunityCopyWith<$Res>(_value.communityUpdates!, (value) {
      return _then(_value.copyWith(communityUpdates: value) as $Val);
    });
  }

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommunityCopyWith<$Res>? get maintenanceAlerts {
    if (_value.maintenanceAlerts == null) {
      return null;
    }

    return $CommunityCopyWith<$Res>(_value.maintenanceAlerts!, (value) {
      return _then(_value.copyWith(maintenanceAlerts: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotificationsImplCopyWith<$Res>
    implements $NotificationsCopyWith<$Res> {
  factory _$$NotificationsImplCopyWith(
          _$NotificationsImpl value, $Res Function(_$NotificationsImpl) then) =
      __$$NotificationsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Community? email,
      Community? sms,
      Community? push,
      Community? payments,
      Community? security,
      Community? community,
      Community? maintenance,
      @JsonKey(name: 'payment_reminders') Community? paymentReminders,
      @JsonKey(name: 'community_updates') Community? communityUpdates,
      @JsonKey(name: 'maintenance_alerts') Community? maintenanceAlerts});

  @override
  $CommunityCopyWith<$Res>? get email;
  @override
  $CommunityCopyWith<$Res>? get sms;
  @override
  $CommunityCopyWith<$Res>? get push;
  @override
  $CommunityCopyWith<$Res>? get payments;
  @override
  $CommunityCopyWith<$Res>? get security;
  @override
  $CommunityCopyWith<$Res>? get community;
  @override
  $CommunityCopyWith<$Res>? get maintenance;
  @override
  $CommunityCopyWith<$Res>? get paymentReminders;
  @override
  $CommunityCopyWith<$Res>? get communityUpdates;
  @override
  $CommunityCopyWith<$Res>? get maintenanceAlerts;
}

/// @nodoc
class __$$NotificationsImplCopyWithImpl<$Res>
    extends _$NotificationsCopyWithImpl<$Res, _$NotificationsImpl>
    implements _$$NotificationsImplCopyWith<$Res> {
  __$$NotificationsImplCopyWithImpl(
      _$NotificationsImpl _value, $Res Function(_$NotificationsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? sms = freezed,
    Object? push = freezed,
    Object? payments = freezed,
    Object? security = freezed,
    Object? community = freezed,
    Object? maintenance = freezed,
    Object? paymentReminders = freezed,
    Object? communityUpdates = freezed,
    Object? maintenanceAlerts = freezed,
  }) {
    return _then(_$NotificationsImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Community?,
      sms: freezed == sms
          ? _value.sms
          : sms // ignore: cast_nullable_to_non_nullable
              as Community?,
      push: freezed == push
          ? _value.push
          : push // ignore: cast_nullable_to_non_nullable
              as Community?,
      payments: freezed == payments
          ? _value.payments
          : payments // ignore: cast_nullable_to_non_nullable
              as Community?,
      security: freezed == security
          ? _value.security
          : security // ignore: cast_nullable_to_non_nullable
              as Community?,
      community: freezed == community
          ? _value.community
          : community // ignore: cast_nullable_to_non_nullable
              as Community?,
      maintenance: freezed == maintenance
          ? _value.maintenance
          : maintenance // ignore: cast_nullable_to_non_nullable
              as Community?,
      paymentReminders: freezed == paymentReminders
          ? _value.paymentReminders
          : paymentReminders // ignore: cast_nullable_to_non_nullable
              as Community?,
      communityUpdates: freezed == communityUpdates
          ? _value.communityUpdates
          : communityUpdates // ignore: cast_nullable_to_non_nullable
              as Community?,
      maintenanceAlerts: freezed == maintenanceAlerts
          ? _value.maintenanceAlerts
          : maintenanceAlerts // ignore: cast_nullable_to_non_nullable
              as Community?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$NotificationsImpl implements _Notifications {
  const _$NotificationsImpl(
      {required this.email,
      required this.sms,
      required this.push,
      required this.payments,
      required this.security,
      required this.community,
      required this.maintenance,
      @JsonKey(name: 'payment_reminders') required this.paymentReminders,
      @JsonKey(name: 'community_updates') required this.communityUpdates,
      @JsonKey(name: 'maintenance_alerts') required this.maintenanceAlerts});

  factory _$NotificationsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationsImplFromJson(json);

  @override
  final Community? email;
  @override
  final Community? sms;
  @override
  final Community? push;
  @override
  final Community? payments;
  @override
  final Community? security;
  @override
  final Community? community;
  @override
  final Community? maintenance;
  @override
  @JsonKey(name: 'payment_reminders')
  final Community? paymentReminders;
  @override
  @JsonKey(name: 'community_updates')
  final Community? communityUpdates;
  @override
  @JsonKey(name: 'maintenance_alerts')
  final Community? maintenanceAlerts;

  @override
  String toString() {
    return 'Notifications(email: $email, sms: $sms, push: $push, payments: $payments, security: $security, community: $community, maintenance: $maintenance, paymentReminders: $paymentReminders, communityUpdates: $communityUpdates, maintenanceAlerts: $maintenanceAlerts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.sms, sms) || other.sms == sms) &&
            (identical(other.push, push) || other.push == push) &&
            (identical(other.payments, payments) ||
                other.payments == payments) &&
            (identical(other.security, security) ||
                other.security == security) &&
            (identical(other.community, community) ||
                other.community == community) &&
            (identical(other.maintenance, maintenance) ||
                other.maintenance == maintenance) &&
            (identical(other.paymentReminders, paymentReminders) ||
                other.paymentReminders == paymentReminders) &&
            (identical(other.communityUpdates, communityUpdates) ||
                other.communityUpdates == communityUpdates) &&
            (identical(other.maintenanceAlerts, maintenanceAlerts) ||
                other.maintenanceAlerts == maintenanceAlerts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      email,
      sms,
      push,
      payments,
      security,
      community,
      maintenance,
      paymentReminders,
      communityUpdates,
      maintenanceAlerts);

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationsImplCopyWith<_$NotificationsImpl> get copyWith =>
      __$$NotificationsImplCopyWithImpl<_$NotificationsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationsImplToJson(
      this,
    );
  }
}

abstract class _Notifications implements Notifications {
  const factory _Notifications(
      {required final Community? email,
      required final Community? sms,
      required final Community? push,
      required final Community? payments,
      required final Community? security,
      required final Community? community,
      required final Community? maintenance,
      @JsonKey(name: 'payment_reminders')
      required final Community? paymentReminders,
      @JsonKey(name: 'community_updates')
      required final Community? communityUpdates,
      @JsonKey(name: 'maintenance_alerts')
      required final Community? maintenanceAlerts}) = _$NotificationsImpl;

  factory _Notifications.fromJson(Map<String, dynamic> json) =
      _$NotificationsImpl.fromJson;

  @override
  Community? get email;
  @override
  Community? get sms;
  @override
  Community? get push;
  @override
  Community? get payments;
  @override
  Community? get security;
  @override
  Community? get community;
  @override
  Community? get maintenance;
  @override
  @JsonKey(name: 'payment_reminders')
  Community? get paymentReminders;
  @override
  @JsonKey(name: 'community_updates')
  Community? get communityUpdates;
  @override
  @JsonKey(name: 'maintenance_alerts')
  Community? get maintenanceAlerts;

  /// Create a copy of Notifications
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationsImplCopyWith<_$NotificationsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
