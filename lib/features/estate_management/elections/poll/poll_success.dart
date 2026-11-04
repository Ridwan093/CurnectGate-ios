import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class voteSubmited extends ConsumerWidget {
  const voteSubmited({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => context.pop(),
        ),
      ),

      body: Center(
        child: Column(
          children: [
            Center(
              child: Icon(
                Icons.check_circle,
                size: 60,
                color: AppColors.instance.teal500,
              ),
            ),
            SizedBox(height: 25),
            Text(
              "Vote Submitted",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
                fontWeight: FontFamilies.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Thank you for your input, your response have been submitted,",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black400,
                fontWeight: FontFamilies.medium,
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () => context.pop(),
              child: Container(
                width: 240,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.instance.black600,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Go back to Poll",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.grey200,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
