class ChargeResult {
  final double fee;
  final String label;
  final bool isPercentage;
  final double percentage;
  const ChargeResult({
    required this.fee,
    required this.label,
    required this.isPercentage,
    required this.percentage,
  });
}
