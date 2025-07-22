import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/widgets.dart';

class EmptyBodys extends StatelessWidget {
  final String message;
  const EmptyBodys({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message,style: TextStyle(

     fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black400,
  ),));
}
  
}

