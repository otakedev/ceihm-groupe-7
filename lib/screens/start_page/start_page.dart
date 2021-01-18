// Flutter
import 'package:flutter/material.dart';

// Internal
import 'package:alergo/core/router.dart';

// Pages
import 'package:alergo/screens/profile_pages/choose_diet_page/choose_diet_page.dart';
import '../home_page.dart';

class StartPage extends StatelessWidget {
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
              onPressed: () => navigateToPage(context, HomePage()),
              child: Text("Scanner"),
            ),
          ],
        ),
      ),
    );
  }
}
