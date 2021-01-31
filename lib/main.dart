import 'package:alergo/providers/profile_selector_notifier.dart';
import 'package:alergo/screens/home_page.dart';
import 'package:alergo/screens/product_page/product_page.dart';
import 'package:alergo/screens/profile_pages/profile_page.dart';
import 'package:alergo/screens/search_page/search_page.dart';
import 'package:alergo/screens/profile_pages/update_profile_page.dart';
import 'package:alergo/screens/start_page/start_page.dart';
import 'package:alergo/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ProfileSelectorNotifier>(
      create: (_) => ProfileSelectorNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alergo Demo',
      theme: appTheme(),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        StartPage.routeName: (context) => StartPage(),
        ProfilePage.routeName: (context) => ProfilePage(),
        ProductPage.routeName: (context) => ProductPage(),
        SearchBarPage.routeName: (context) => SearchBarPage(),
        UpdateProfilePage.routeName: (context) => UpdateProfilePage(),
      },
    );
  }
}
