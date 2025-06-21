import 'package:curnectgate/features/%20operations/violation/model/report_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reportProvider = StateNotifierProvider<ReportNotifier, ReportState>((ref) {
  return ReportNotifier();
});

class ReportNotifier extends StateNotifier<ReportState> {
  ReportNotifier()
      : super(ReportState(
          report: Report(),
          isLoading: false,
        ));

  void setCategory(String category) {
    state = state.copyWith(
      report: state.report.copyWith(category: category),
    );
  }

  void setDescription(String description) {
    state = state.copyWith(
      report: state.report.copyWith(description: description),
    );
  }

  void addImage(String imagePath) {
    state = state.copyWith(
      report: state.report.copyWith(
        imagePaths: [...state.report.imagePaths, imagePath],
      ),
    );
  }

  void toggleAnonymous() {
    state = state.copyWith(
      report: state.report.copyWith(
        isAnonymous: !state.report.isAnonymous,
      ),
    );
  }

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }

  Future<void> submitReport() async {
    setLoading(true);
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      // Reset after submission
      state = ReportState(report: Report());
    } finally {
      setLoading(false);
    }
  }
}