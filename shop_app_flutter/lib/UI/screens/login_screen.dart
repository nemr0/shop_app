import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shop_app_flutter/UI/screens/register.dart';
import 'package:shop_app_flutter/UI/widgets/before_home.dart';
import 'package:shop_app_flutter/UI/widgets/buttons/not_styled_button.dart';
import 'package:shop_app_flutter/UI/widgets/helpers/push.dart';
import 'package:shop_app_flutter/config/constants.dart';

import '../widgets/buttons/custom_button.dart';
import '../widgets/custom_textfield.dart';
import 'forgot_screen.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return BeforeHomeBuilder(
        scaffoldBgColor: darkCatColor,
        containerWidth: width > height ? 400 : width * .9,
        containerHeight: height * .5,
        lightColor: lightCatColor,
        darkColor: darkCatColor,
        rivAsset: rivLoginCat,
        title: 'Login',
        withArrow: false,
        children: [
          Text(
            'HEY YOU, ICE CREAM🍦,\nplease enter your email and password.',
            style: TextStyle(color: darkCatColor.withOpacity(.9)),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NotStyledButton(
                onPressed: () => push(const RegisterScreen(), context),
                text: 'First Time?',
              ),
              NotStyledButton(
                onPressed: () => push(const ForgotScreen(), context),
                text: 'Forgot Password?',
              ),
            ],
          ),
          CustomTextField(
            darkColor: darkCatColor,
            lightColor: lightCatColor,
            controller: TextEditingController(),
            hintText: 'Email Address',
          ),
          const SizedBox(
            height: 1,
          ),
          CustomTextField(
            darkColor: darkCatColor,
            lightColor: lightCatColor,
            controller: TextEditingController(),
            isMiddle: true,
            hintText: 'Password',
            isObscure: true,
          ),
          const SizedBox(
            height: 1,
          ),
          CustomButton(
              darkColor: darkCatColor.withOpacity(.9),
              onPressed: () {},
              lightColor: lightCatColor,
              text: 'Login'),
        ]);
  }
}
