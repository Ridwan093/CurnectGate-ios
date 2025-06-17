import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/estate_onboarding/widget/button/estate_button.dart';
import 'package:flutter/material.dart';

class MemberSuccessScreen extends StatelessWidget {
  const MemberSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            
            _buildsuccessContainer(), ActionButton(label: "Got it",onPressed: (){},)],
        ),
      ),
    );
  }

  _buildsuccessContainer() {
    return Column(
      children: [
        SizedBox(height: 100,),
        Container(
          
          height: 75,
          width: 75,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 1.5,
              style: BorderStyle.solid,
              color: AppColors.instance.teal500,
            ),
          ),
          child: Center(
            child: Icon(
              Icons.check_circle,
              size: 60,
              color: AppColors.instance.teal500,
            ),
          ),
        ),
        const SizedBox(height: 25),
        Text(
          "We got your code!, you now have entry",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black600,
            fontWeight: FontFamilies.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
