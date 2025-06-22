class GenerateState {
  final String vistorName;
  final String purposeofVisit;
  final bool isLoading;
  final String visitperiod;

  GenerateState({
    this.purposeofVisit = '',
    this.visitperiod = '',
  this.isLoading = false,
    this.vistorName = '',
  });

  GenerateState copyWith({
    String? vistorName,
    String? purposeofVisit,
  bool? isLoading,
    String? visitperiod,
  }) {
    return GenerateState(
      visitperiod: visitperiod ?? this.visitperiod,
      vistorName: vistorName ?? this.vistorName,
      purposeofVisit: purposeofVisit ?? this.purposeofVisit,
      isLoading: isLoading ?? this.isLoading
    );
  }
}

List<GenerateState> vistoCardList = [];
