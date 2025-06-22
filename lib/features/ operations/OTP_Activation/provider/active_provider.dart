import 'dart:developer';


import 'package:curnectgate/features/%20operations/OTP_Activation/model/generate_model.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';


final activeOTPProvider = StateNotifierProvider<ReportNotifier, GenerateState>((
  ref,
) {
  return ReportNotifier();
});

class ReportNotifier extends StateNotifier<GenerateState> {
  ReportNotifier() : super(GenerateState(isLoading: false));

  void setPurpose(String purpose) {
    state = state.copyWith(purposeofVisit:purpose);
  }
void setPeriod(String period) {
    state = state.copyWith(visitperiod:period);
  }

  void setVisitorName(String visitorName) {
    state = state.copyWith(
      vistorName: visitorName);
    
  }


  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }

  Future<void> submitReport() async {
    setLoading(true);
    try {
   

      // Convert Map<int, ReportFile> to list of file maps
    
      // Prepare the complete report data
     
    //   final reportlist = Reports(
    //     type: fileList.first["type"],
    //     name: fileList.first["name"],
    //     size: fileList.first["size"],
    //     path: fileList.first["path"],
    //     files: fileList.first["file"],
    //     category: currentReport.category,
    //     description: currentReport.description,
    //     isAnonymous: currentReport.isAnonymous,
    //     imagePaths: currentReport.imagePaths.values.toString(),
    //   );
    //  log('Submitting222 report: $reportlist');
    //   log('Submitting report: $reportData');

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Reset after submission
      state = GenerateState(isLoading: false,);
    } catch (e) {
     
      rethrow;
    } finally {
      setLoading(false);
    }
  }
}
