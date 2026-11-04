// due_payment_provider.dart

class DuePaymentModel {
  final String id;
  final String title;
  final String amount;
  final String subtitle;
  final String iconPath;
  bool isSelected;

  DuePaymentModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.subtitle,
    required this.iconPath,
    this.isSelected = false,
  });
}
