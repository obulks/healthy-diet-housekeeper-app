import 'dart:io';
import 'package:flutter/material.dart';

class MyScrollConfiguration extends StatelessWidget {
  final Widget child;
  final Color color;

  const MyScrollConfiguration({
    Key key,
    this.child,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: _MyBehavior(),
      child: color == null
          ? child
          : GlowingOverscrollIndicator(
              color: color,
              axisDirection: AxisDirection.down,
              child: child,
            ),
    );
  }
}

class _MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    if (Platform.isAndroid || Platform.isFuchsia) {
      return child;
    } else {
      return super.buildViewportChrome(context, child, axisDirection);
    }
  }
}
