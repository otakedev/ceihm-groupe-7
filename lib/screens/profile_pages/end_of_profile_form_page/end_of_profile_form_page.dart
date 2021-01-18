// Flutter
import 'package:alergo/screens/profile_pages/choose_unliked_products_page/choose_unliked_products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Internal
import 'package:alergo/core/router.dart';

// Pages
import '../../home_page.dart';

class EndOfProfileFormPage extends StatefulWidget {
  @override
  _EndOfProfileFormPageState createState() => _EndOfProfileFormPageState();
}

class _EndOfProfileFormPageState extends State<EndOfProfileFormPage> {
  List<int> selectedIndexes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ALERGO"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Votre profil est complet. Vous pourez le modifier à tout moment (Icone Profil).',
            textAlign: TextAlign.center,
          ),
          RaisedButton(
            onPressed: () => navigateToPage(context, HomePage()),
            child: Text("Parfait !"),
          ),
        ]),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            FlatButton(
              onPressed: () =>
                  navigateToPage(context, ChooseUnlikedProductsPage()),
              child: Text("< Je n'aime pas"),
            ),
          ],
        ),
      ),
    );
  }
}
