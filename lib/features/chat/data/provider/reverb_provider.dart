// providers/reverb_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReverbConfig {
  final String appKey;
  final String host;
  final String port;
  final String scheme;
  final String authEndpoint;

  ReverbConfig({
    required this.appKey,
    required this.host,
    required this.port,
    required this.scheme,
    required this.authEndpoint,
  });

  factory ReverbConfig.fromJson(Map<String, dynamic> json) {
    return ReverbConfig(
      appKey: json['app_key'],
      host: json['host'],
      port: json['port'],
      scheme: json['scheme'],
      authEndpoint: json['auth_endpoint'],
    );
  }
}

final reverbConfigProvider = StateProvider<ReverbConfig?>((ref) => null);