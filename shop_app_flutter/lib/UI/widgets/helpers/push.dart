import 'package:flutter/cupertino.dart';

push(Widget widget, BuildContext context) => Navigator.of(context)
    .push(CupertinoPageRoute(builder: (context) => widget));
