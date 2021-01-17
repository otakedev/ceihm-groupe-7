import 'package:alergo/screens/display_product_page/display_product.dart';
import 'package:alergo/screens/home_page.dart';
import 'package:alergo/screens/scanner_page/scanner_page.dart';
import 'package:alergo/theme/style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alergo Demo',
      theme: appTheme(),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/display': (context) => DisplayProduct(),
      },
    );
  }
}
