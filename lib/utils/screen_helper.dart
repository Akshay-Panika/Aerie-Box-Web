import 'package:flutter/cupertino.dart';

class ScreenHelper {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
          MediaQuery.of(context).size.width < 1000;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1000;
}
