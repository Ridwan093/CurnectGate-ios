  // Helper Widgets
  import 'package:curnectgate/core/style/colors.dart';
import 'package:flutter/material.dart';



 



class Loadingstates extends StatelessWidget {
  const Loadingstates({super.key});

  @override
  Widget build(BuildContext context) {
  return Center(
      child: CircularProgressIndicator(color: AppColors.instance.yellow500),
    );
  }
}