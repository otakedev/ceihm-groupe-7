// Flutter
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Internal
import 'package:alergo/core/router.dart';

// Pages
import '../choose_unliked_products_page/choose_unliked_products_page.dart';
import 'package:alergo/screens/profile_pages/choose_diet_page/choose_diet_page.dart';

class ChooseForbiddenProductsPage extends StatelessWidget {
  const ChooseForbiddenProductsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => log("cancel pressed"),
          icon: Icon(Icons.cancel),
        ),
        title: Text("Je ne peux pas"),
      ),
      body: Container(child: Text('the list goes here')),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            FlatButton(
              onPressed: () => navigateToPage(context, ChooseDietPage()),
              child: Text("< Choix du régime"),
            ),
            Spacer(),
            RaisedButton(
              onPressed: () =>
                  navigateToPage(context, ChooseUnlikedProductsPage()),
              child: Text("Suivant"),
            ),
          ],
        ),
      ),
    );
  }
}
