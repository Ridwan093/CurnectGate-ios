import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class Expiresessionbody extends StatelessWidget {
  const Expiresessionbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Your session has expired"),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            /* your login logic */
            child: Text(
              "Login Again",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
