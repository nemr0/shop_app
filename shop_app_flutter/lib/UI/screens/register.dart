import 'package:flutter/material.dart';
import 'package:shop_app_flutter/UI/widgets/before_home.dart';
import 'package:shop_app_flutter/config/constants.dart';
import '../widgets/buttons/custom_button.dart';
import '../widgets/custom_textfield.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return BeforeHomeBuilder(
        scaffoldBgColor: darkCrocodileColor,
        containerWidth: width > height ? 400 : width * .9,
        containerHeight: height * .5,
        lightColor: lightCrocodileColor,
        darkColor: darkCrocodileColor,
        rivAsset: rivGetStarted,
        title: 'Register',
        stateMachines: const ['stateMachine'],
        animations: const [
          'jump',
          'idle',
        ],
        withArrow: true,
        children: [
          Text(
            'HEY YOU, NEWBIE,\nplease enter your username, email and password.',
            style: TextStyle(color: darkCrocodileColor.withOpacity(.9)),
            textAlign: TextAlign.center,
          ),
          CustomTextField(
            darkColor: darkCrocodileColor,
            lightColor: lightCrocodileColor,
            controller: TextEditingController(),
            hintText: 'Username',
          ),
          const SizedBox(
            height: 1,
          ),
          CustomTextField(
              darkColor: darkCrocodileColor,
              lightColor: lightCrocodileColor,
              controller: TextEditingController(),
              hintText: 'Email Address',
              isMiddle: true),
          const SizedBox(
            height: 1,
          ),
          CustomTextField(
            darkColor: darkCrocodileColor,
            lightColor: lightCrocodileColor,
            controller: TextEditingController(),
            isMiddle: true,
            hintText: 'Password',
            isObscure: true,
          ),
          const SizedBox(
            height: 1,
          ),
          CustomButton(
              darkColor: darkCrocodileColor.withOpacity(.9),
              onPressed: () {},
              lightColor: lightCatColor,
              text: 'Register'),
        ]);
  }
}
