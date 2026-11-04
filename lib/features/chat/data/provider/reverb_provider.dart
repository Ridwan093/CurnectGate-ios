// providers/reverb_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
class ReverbConfig {
  final String appKey;
  final String host;
  final int port;
  final String scheme;
  final String authEndpoint;
  final String broadcaster;
  final String? cluster;

  ReverbConfig({
    required this.appKey,
    required this.host,
    required this.port,
    required this.scheme,
    required this.authEndpoint,
    required this.broadcaster,
    this.cluster,
  });

  /// Deserialize from JSON
  factory ReverbConfig.fromJson(Map<String, dynamic> json) {
    return ReverbConfig(
      cluster: json['cluster'],
      appKey: json['app_key'],
      host: json['host'],
      port: json['port'],
      scheme: json['scheme'],
      authEndpoint: json['auth_endpoint'],
      broadcaster: json['broadcaster'],
    );
  }

  /// Serialize to JSON
  Map<String, dynamic> toJson() {
    return {
      'cluster': cluster,
      'app_key': appKey,
      'host': host,
      'port': port,
      'scheme': scheme,
      'auth_endpoint': authEndpoint,
      'broadcaster': broadcaster,
    };
  }
}

final reverbConfigProvider = StateProvider<ReverbConfig?>((ref) => null);