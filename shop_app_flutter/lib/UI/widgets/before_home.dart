import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'logo.dart';

class BeforeHomeBuilder extends StatelessWidget {
  final List<Widget> children;
  final double containerWidth;
  final double containerHeight;
  final Color lightColor;
  final Color darkColor;
  final String rivAsset;
  final String title;
  final Color textColor;
  final double bottom;
  final double? top;
  final Color? scaffoldBgColor;
  final bool? withArrow;
  final List<String> stateMachines;
  final List<String> animations;
  const BeforeHomeBuilder({
    Key? key,
    required this.children,
    required this.containerWidth,
    required this.containerHeight,
    required this.lightColor,
    required this.darkColor,
    required this.rivAsset,
    required this.title,
    this.textColor = Colors.black87,
    this.bottom = 50,
    this.top,
    this.scaffoldBgColor,
    this.withArrow,
    this.stateMachines = const [],
    this.animations = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      body: Stack(alignment: AlignmentDirectional.center, children: [
        RiveAnimation.asset(rivAsset,
            fit: BoxFit.cover,
            stateMachines: stateMachines,
            animations: animations),
        Positioned(
          top: top,
          bottom: top == null ? bottom : null,
          child: Container(
            height: containerHeight,
            width: containerWidth,
            padding: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                color: lightColor.withOpacity(.85),
                borderRadius: BorderRadius.circular(30)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Logo(
                  withArrow: withArrow ?? true,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: textColor)),
                ...children,
              ],
            ),
          ),
        )
      ]),
    );
  }
}
