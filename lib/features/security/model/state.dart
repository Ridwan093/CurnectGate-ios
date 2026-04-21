class ReminderState {
  final String? id;
  final String title;
  final String dec;
  final String category;
  final String remberType;
  final String time;
  final String frequence;
  final String piority;
  final bool isSharedWithHousehold;
  final String interva;
  final String notificationmethod;
  final List<int> selectedHouseholdMembers;
  final bool isLoading;
  final String filter;

  ReminderState({
    this.isLoading = false,
    this.notificationmethod = "",
    this.filter = '',
    this.id = "",
    this.title = "",
    this.dec = "",
    this.category = "",
    this.remberType = "",
    this.time = "",
    this.frequence = "",
    this.piority = "",
    this.isSharedWithHousehold = false,
    this.interva = "",
    this.selectedHouseholdMembers = const [],
  });

  bool get reminderValidate {
    final baseValid = title.isNotEmpty &&
        dec.isNotEmpty &&
        category.isNotEmpty &&
        time.isNotEmpty &&
        remberType.isNotEmpty &&
        notificationmethod.isNotEmpty;

    if (remberType.toLowerCase().contains("recurring")) {
      return baseValid && frequence.isNotEmpty && interva.isNotEmpty;
    }

    return baseValid;
  }

  bool get updateValid =>
      title.isNotEmpty &&
      dec.isNotEmpty &&
      time.isNotEmpty &&
      piority.isNotEmpty &&
      notificationmethod.isNotEmpty;

  ReminderState copyWith({
    String? id,
    String? title,
    String? dec,
    String? category,
    String? remberType,
    String? time,
    String? frequence,
    String? piority,
    bool? isSharedWithHousehold,
    String? interva,
    String? notificationmethod,
    String? filter,
    bool? isLoading,
    List<int>? selectedHouseholdMembers,
  }) {
    return ReminderState(
      filter: filter ?? this.filter,
      isLoading: isLoading ?? this.isLoading,
      notificationmethod: notificationmethod ?? this.notificationmethod,
      id: id ?? this.id,
      title: title ?? this.title,
      dec: dec ?? this.dec,
      category: category ?? this.category,
      remberType: remberType ?? this.remberType,
      time: time ?? this.time,
      frequence: frequence ?? this.frequence,
      piority: piority ?? this.piority,
      isSharedWithHousehold:
          isSharedWithHousehold ?? this.isSharedWithHousehold,
      interva: interva ?? this.interva,
      selectedHouseholdMembers:
          selectedHouseholdMembers ?? this.selectedHouseholdMembers,
    );
  }
}
