import 'package:flutter/material.dart';
import 'screen_helper.dart';

class RFont {
  static double size(BuildContext context, double mobile,
      {double? tablet, double? desktop}) {
    if (ScreenHelper.isDesktop(context)) {
      return desktop ?? tablet ?? mobile;
    }

    if (ScreenHelper.isTablet(context)) {
      return tablet ?? mobile;
    }

    return mobile;
  }
}
