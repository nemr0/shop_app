import 'package:flutter/material.dart';

import '../../../config/theme/light.dart';

class CustomButton extends StatelessWidget {
  final Color darkColor;
  final Color lightColor;
  final VoidCallback onPressed;
  final String text;
  final bool? isBottomCircular;

  const CustomButton(
      {Key? key,
      required this.darkColor,
      required this.onPressed,
      required this.lightColor,
      required this.text,
      this.isBottomCircular = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Hero(
        tag: 'button',
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => darkColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft:
                            isBottomCircular == true ? radius : Radius.zero,
                        bottomRight:
                            isBottomCircular == true ? radius : Radius.zero,
                        topLeft:
                            isBottomCircular == false ? radius : Radius.zero,
                        topRight:
                            isBottomCircular == false ? radius : Radius.zero),
                  ))),
              onPressed: () {},
              child: Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: lightColor),
              )),
        ),
      ),
    );
  }
}
