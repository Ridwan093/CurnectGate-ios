import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

/// Reasons the backend sends (in `data.reason`) when a feature has been switched
/// off for the member, by their landlord / landlord's spouse or by the estate.
const _restrictionReasons = {
  'restricted_by_household',
  'restricted',
  'not_included',
};

/// Thrown by the API layer when the server answers 403 because the member's
/// access to a feature has been restricted. `toString()` is the server's
/// message, so existing `e.toString()` call sites keep showing readable text.
class PermissionDeniedException implements Exception {
  final String message;
  final String? reason;
  final List<String> permissions;

  /// Messages of restrictions seen in this session, so widgets that only
  /// receive the error text (e.g. [Builderroul]) can still recognise them.
  static final Set<String> _knownMessages = {};

  PermissionDeniedException({
    required this.message,
    this.reason,
    this.permissions = const [],
  }) {
    _knownMessages.add(message);
  }

  /// Builds the exception from a 403 response body, or returns null when the
  /// 403 is not a permission restriction (e.g. a plan or duty check).
  static PermissionDeniedException? fromResponse(int? statusCode, dynamic body) {
    if (statusCode != 403 || body is! Map) return null;

    final data = body['data'];
    final reason = data is Map ? data['reason']?.toString() : null;
    if (reason == null || !_restrictionReasons.contains(reason)) return null;

    final required = data is Map ? data['required_permissions'] : null;

    return PermissionDeniedException(
      message:
          body['message']?.toString() ??
          'Access to this feature has been turned off for your account.',
      reason: reason,
      permissions:
          required is List ? required.map((e) => e.toString()).toList() : [],
    );
  }

  /// Whether an error (object or its text) is a restriction.
  static bool isRestriction(Object? error) {
    if (error is PermissionDeniedException) return true;
    if (error == null) return false;
    final text = error.toString().replaceAll('Exception: ', '').trim();
    return _knownMessages.contains(text);
  }

  @override
  String toString() => message;
}

/// Features the server reported as switched off for the signed-in member,
/// taken from the `restricted_features` map ({slug: message}) on responses
/// that bundle several features (payments dashboard, payment history, ...).
class RestrictedFeatures {
  RestrictedFeatures._();

  static final Map<String, String> _messages = {};

  /// Refreshes the given slugs from a response's `restricted_features` value.
  /// Slugs in [scope] that are missing from the map are allowed again.
  static void sync(dynamic restricted, List<String> scope) {
    for (final slug in scope) {
      _messages.remove(slug);
    }
    if (restricted is! Map) return;

    restricted.forEach((slug, message) {
      final key = slug.toString();
      if (scope.contains(key)) {
        _messages[key] = message?.toString() ?? 'This feature has been turned off for your account.';
      }
    });
  }

  /// Reads `data.restricted_features` from a raw response body.
  static void syncFromBody(dynamic body, List<String> scope) {
    final data = body is Map ? body['data'] : null;
    sync(data is Map ? data['restricted_features'] : null, scope);
  }

  /// Forget everything, e.g. when the signed-in account changes.
  static void clear() => _messages.clear();

  static bool isRestricted(String slug) => _messages.containsKey(slug);

  static String? message(String slug) => _messages[slug];
}

/// Clear "access restricted" body shown in place of a feature's content.
class RestrictedAccessView extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final bool compact;

  const RestrictedAccessView({
    super.key,
    required this.message,
    this.onRetry,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: compact ? 12 : 24,
          vertical: compact ? 8 : 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.lock_outline,
              size: compact ? 28 : 44,
              color: AppColors.instance.black400,
            ),
            SizedBox(height: compact ? 6 : 14),
            Text(
              'Access restricted',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: compact ? 14 : 16,
                fontWeight: FontWeight.bold,
                color: AppColors.instance.black600,
              ),
            ),
            SizedBox(height: compact ? 4 : 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: compact ? 12 : 14,
                height: 1.4,
                color: AppColors.instance.black400,
              ),
            ),
            if (onRetry != null) ...[
              SizedBox(height: compact ? 8 : 18),
              TextButton(
                onPressed: onRetry,
                child: Text(
                  'Refresh',
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontWeight.bold,
                    color: AppColors.instance.black600,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
