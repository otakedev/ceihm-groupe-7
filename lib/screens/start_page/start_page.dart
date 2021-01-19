import 'package:alergo/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:alergo/core/router.dart';
import 'package:alergo/screens/profile_pages/choose_diet_page/choose_diet_page.dart';

class StartPage extends StatelessWidget {
  static final routeName = '/start';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ALERGO"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () => navigateToPage(context, ChooseDietPage()),
              child: Text("Définir votre profil"),
            ),
            RaisedButton(
              onPressed: () => navigateToRoute(context, HomePage.routeName),
              child: Text("Scanner"),
            ),
          ],
        ),
      ),
    );
  }
}
