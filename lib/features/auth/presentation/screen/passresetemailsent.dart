import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/auth/presentation/screen/creatnewpassword.dart';
import 'package:flutter/material.dart';

class PasswordResetSend extends StatelessWidget {
  const PasswordResetSend({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.instance.black500,
          ),
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: _biuldbody(context),
      ),
    );
  }

  Widget _biuldbody(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 5, right: 5, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(Icons.check_circle, size: 40, color: AppColors.instance.teal500),
          const SizedBox(height: 20),

          Text(
            "Password reset\n email sent!",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
            ),
          ),
          SizedBox(height: 10),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                color: AppColors.instance.black400,
                fontSize: 14,

                wordSpacing: 2,
                fontFamily: FontFamilies.interDisplay,
              ),
              children: <TextSpan>[
                const TextSpan(
                  text:
                      'If you have an account with us, you will receive a link to reset your password at ',
                ),
                TextSpan(
                  text: 'Samlee.curnect@mail.com',

                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontFamilies.bold,
                    color: AppColors.instance.black500,
                    // You can add other styles like color if needed
                    // color: Colors.blue,
                  ),
                ),
                const TextSpan(
                  text:
                      '. Follow the directions in the email to reset your password.',
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Wrap(
            direction: Axis.vertical,

            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 2,
            children: [
              Text(
                'Didn\'t receive an email? Check your spam folder or ',
                style: TextStyle(
                  color: AppColors.instance.black400,
                  fontSize: 14,

                  fontFamily: FontFamilies.interDisplay,
                ),
              ),
              GestureDetector(
                onTap: () {
                  //domin rougte chang later PasswordReset
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewPassword()),
                  );
                },
                child: Text(
                  'Resend Link',
                  style: TextStyle(
                    color: AppColors.instance.black500,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
// IF you have an account with us, you will recieve a link to reset your password at  Samlee.curnect@mail.com. 
// Follow the directions in the email to reset your password.