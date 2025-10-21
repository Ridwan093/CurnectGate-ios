// models/digital_id_status.dart
class DigitalIdStatus {
  final bool hasDigitalId;
  final bool canGenerate;
  final bool hasGateAccess;

  DigitalIdStatus({
    required this.hasDigitalId,
    this.canGenerate = false,
    this.hasGateAccess = false,
  });

  factory DigitalIdStatus.fromJson(Map<String, dynamic> json) {
    final status = json['status'] == true;

    if (!status) {
      final data = json['data'] ?? {};
      return DigitalIdStatus(
        hasDigitalId: false,
        canGenerate: data['can_generate'] ?? false,
        hasGateAccess: data['has_gate_access'] ?? false,
      );
    }

    return DigitalIdStatus(
      hasDigitalId: true,
      canGenerate: true,
      hasGateAccess: true,
    );
  }
}
