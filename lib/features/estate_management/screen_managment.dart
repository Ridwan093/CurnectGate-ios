



import 'package:flutter_riverpod/flutter_riverpod.dart';
abstract class BaseVerificationScreen extends ConsumerStatefulWidget {
  final int currentStep;
  final int totalSteps;
  final String title;
  final String description;
  final bool showBottomAction;

  const BaseVerificationScreen({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    required this.title,
    required this.description,
    this.showBottomAction = true,
  });
}