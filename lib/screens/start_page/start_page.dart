import 'package:alergo/core/router.dart';
import 'package:alergo/screens/home_page.dart';
import 'package:alergo/screens/profile_pages/profile_page.dart';
import 'package:flutter/material.dart';

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
              onPressed: () => navigateToRoute(context, ProfilePage.routeName),
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
