import 'package:flutter/material.dart';

navigateToPage(BuildContext context, Widget widget, {bool replace = false}) {
  replace
      ? Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => widget))
      : Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget),
        );
}

navigateToRoute(BuildContext context, String route,
    {Object arguments, bool replace = false}) {
  replace
      ? Navigator.pushReplacementNamed(context, route, arguments: arguments)
      : Navigator.pushNamed(context, route, arguments: arguments);
}

navigateBackFromPage<T extends Object>(BuildContext context, [T result]) {
  Navigator.pop(context, result);
}
