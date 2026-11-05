import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

/// Dates and times on the estate's own clock.
///
/// Each estate works in its own timezone (for example Africa/Accra for a
/// Ghana estate). The API sends exact instants ("...Z" or "+01:00"), and
/// [parse] turns them into the estate's wall-clock time, so `DateFormat`
/// shows what residents and security see on the estate's clocks, whatever
/// timezone the phone is set to. The timezone is loaded with the estate
/// currency (see `EstateCurrency.load`) and kept on the device.
class EstateTime {
  EstateTime._();

  static const _kTimezone = 'estate_timezone';

  static tz.Location? _location;
  static bool _initialised = false;
  static bool _restored = false;

  /// IANA name of the estate timezone, or null while it is unknown.
  static String? get timezoneName => _location?.name;

  static void _ensureDatabase() {
    if (_initialised) return;
    _initialised = true;
    try {
      tzdata.initializeTimeZones();
    } catch (e) {
      log('EstateTime: could not load timezone data: $e');
    }
  }

  /// Restores the last known estate timezone from the device (no network).
  static Future<void> restore() async {
    if (_restored) return;
    _restored = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      _setLocation(prefs.getString(_kTimezone));
    } catch (_) {
      // Keep the device timezone.
    }
  }

  /// Uses this IANA timezone (from the API) and keeps it on the device.
  static Future<void> apply(String? name) async {
    if (!_setLocation(name)) return;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_kTimezone, name!);
    } catch (_) {
      // Still applied for this session.
    }
  }

  /// Forgets the estate timezone on sign out.
  static Future<void> clear() async {
    _location = null;
    _restored = false;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_kTimezone);
    } catch (_) {
      // Nothing stored.
    }
  }

  static bool _setLocation(String? name) {
    if (name == null || name.isEmpty) return false;
    _ensureDatabase();
    try {
      _location = tz.getLocation(name);
      return true;
    } catch (_) {
      return false;
    }
  }

  /// The current time on the estate clock.
  static DateTime now() {
    final location = _location;
    return location == null ? DateTime.now() : tz.TZDateTime.now(location);
  }

  /// The same instant on the estate clock (device clock while unknown).
  static DateTime toEstate(DateTime time) {
    final location = _location;
    return location == null ? time.toLocal() : tz.TZDateTime.from(time, location);
  }

  /// Like [DateTime.parse], on the estate clock. A value with an offset
  /// ("Z", "+01:00") is converted; a value without one ("2026-11-05",
  /// "2026-11-05 14:00:00") is already estate time and keeps its digits.
  static DateTime parse(String value) {
    final parsed = DateTime.parse(value);
    if (_hasOffset(value)) return toEstate(parsed);
    final location = _location;
    if (location == null) return parsed;
    return tz.TZDateTime(
      location,
      parsed.year,
      parsed.month,
      parsed.day,
      parsed.hour,
      parsed.minute,
      parsed.second,
      parsed.millisecond,
    );
  }

  /// Like [DateTime.tryParse], on the estate clock.
  static DateTime? tryParse(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    try {
      return parse(value.trim());
    } catch (_) {
      return null;
    }
  }

  static final RegExp _offset = RegExp(r'(Z|[+-]\d{2}:?\d{2})$', caseSensitive: false);

  static bool _hasOffset(String value) {
    final v = value.trim();
    // A date alone ("2026-11-05") has no time, so no offset either.
    return v.contains(':') && _offset.hasMatch(v);
  }
}
