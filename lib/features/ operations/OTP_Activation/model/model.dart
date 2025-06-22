class ActiveOtpModel {
  final String vistorName;
  final String visittype;

  final DateTime endDay;
   final DateTime endtime;
 



  ActiveOtpModel({

    required this.endtime,
    required this.endDay,
    required this.visittype,
    required this.vistorName,
    
    
  });
}

List<ActiveOtpModel> vistoCardList = [];
