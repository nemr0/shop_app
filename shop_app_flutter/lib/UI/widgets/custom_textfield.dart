import 'package:flutter/material.dart';

import '../../config/constants.dart';
import '../../config/theme/light.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final VoidCallback? onEditingComplete;
  final int maxLines;
  final Color darkColor;
  final Color lightColor;
  final bool isMiddle;
  final String hintText;
  final bool isObscure;
  const CustomTextField(
      {Key? key,
      required this.controller,
      this.textInputType,
      this.textInputAction,
      this.onEditingComplete,
      this.maxLines = 1,
      this.darkColor = darkDoryColor,
      this.lightColor = lightDoryColor,
      this.isMiddle = false,
      required this.hintText,
      this.isObscure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: hintText,
      child: Material(
        color: Colors.transparent,
        child: TextField(
          controller: controller,
          keyboardType: textInputType ?? TextInputType.emailAddress,
          textInputAction: textInputAction ?? TextInputAction.send,
          textCapitalization: TextCapitalization.characters,
          onEditingComplete: onEditingComplete,
          maxLines: maxLines,
          obscuringCharacter: '*',
          obscureText: isObscure,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: lightColor,
            ),
            border: border(darkColor.withOpacity(.4), isMiddle),
            enabledBorder: border(darkColor.withOpacity(.4), isMiddle),
            errorBorder: border(Colors.redAccent, isMiddle),
            focusedBorder: border(darkColor.withOpacity(.8), isMiddle),
          ),
        ),
      ),
    );
  }
}
