class VendorLogModel {
  final String vendorName;
  final String worktype;
  final String workNumbers;
  final String email;
  final String phonenumber;
  final DateTime startDay;
  final DateTime endDay;
  final String windowTime;
  final String taskStatus;
  final String description;
  final String daysCount;



  VendorLogModel({
    required this.daysCount,
    required this.description,
    required this.startDay,
    required this.endDay,
    required this.windowTime,
    required this.vendorName,
    required this.worktype,
    required this.workNumbers,
    required this.taskStatus,

    required this.email,
    required this.phonenumber,
  });
}

List<VendorLogModel> vendorList = [];
