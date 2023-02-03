import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:shop_app_flutter/config/constants.dart';

const Widget logo = Center(
  child: SizedBox(
    height: 100,
    width: 100,
    child: RiveAnimation.asset(
      rivShop,
      fit: BoxFit.cover,
      // animations: ['working'],
    ),
  ),
);

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
    this.withArrow = true,
    this.arrowColor = darkDoryColor,
  }) : super(key: key);
  final bool withArrow;
  final Color arrowColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: withArrow
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                      color: arrowColor,
                    )),
                logo,
                const SizedBox(
                  width: 40,
                ),
              ],
            )
          : logo,
    );
  }
}
