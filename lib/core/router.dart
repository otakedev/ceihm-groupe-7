import 'package:flutter/material.dart';

navigateToPage(BuildContext context, Widget widget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

navigateToRoute(BuildContext context, String route) {
  Navigator.pushNamed(context, route);
}

navigateBackFromPage(BuildContext context) {
  Navigator.pop(context);
}
