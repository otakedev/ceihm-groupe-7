// Flutter
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Internal
import 'package:alergo/core/router.dart';

// Pages
import '../../home_page.dart';
import 'package:alergo/screens/profile_pages/choose_unliked_products_page/choose_unliked_products_page.dart';

class EndOfProfileFormPage extends StatelessWidget {
  final VoidCallback goToPreviousPage;
  const EndOfProfileFormPage({Key key, @required this.goToPreviousPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("ALERGO"),
      // ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Votre profil est complet. Vous pourez le modifier à tout moment (Icone Profil).',
            textAlign: TextAlign.center,
          ),
          RaisedButton(
            onPressed: () => navigateToRoute(context, '/home'),
            child: Text("Parfait !"),
          ),
        ]),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            FlatButton(
              onPressed: () => goToPreviousPage(),
              child: Text("< Je n'aime pas"),
            ),
          ],
        ),
      ),
    );
  }
}
