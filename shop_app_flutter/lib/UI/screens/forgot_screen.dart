import 'package:flutter/material.dart';
import 'package:shop_app_flutter/UI/widgets/before_home.dart';
import 'package:shop_app_flutter/UI/widgets/buttons/custom_button.dart';
import 'package:shop_app_flutter/config/constants.dart';

import '../widgets/custom_textfield.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return BeforeHomeBuilder(
        containerWidth: width > height ? 400 : width * .9,
        containerHeight: height * .4,
        lightColor: lightDoryColor,
        darkColor: darkDoryColor,
        rivAsset: rivDory,
        title: 'Forgot Password?',
        children: [
          Text(
            'YOU DORY! enter your email to verify your account',
            style: TextStyle(color: darkDoryColor.withOpacity(.6)),
          ),
          const Spacer(),
          CustomTextField(
            controller: TextEditingController(),
            hintText: 'Email Address',
          ),
          CustomButton(
              darkColor: darkDoryColor,
              onPressed: () {},
              lightColor: lightDoryColor,
              text: 'Send Reset Email'),
        ]);
  }
}
