import 'dart:developer';

import 'package:alergo/core/router.dart';
import 'package:alergo/screens/profile_pages/choose_forbidden_products_page/choose_forbidden_products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChooseDietPage extends StatelessWidget {
  const ChooseDietPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => log("cancel pressed"),
          icon: Icon(Icons.cancel),
        ),
        title: Text("Choix du régime"),
      ),
      body: Container(child: Text('the list goes here')),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Spacer(),
            RaisedButton(
              // The diet page does not have a "Précédent" button
              onPressed: () =>
                  navigateToPage(context, ChooseForbiddenProductsPage()),
              child: Text("Suivant"),
            ),
          ],
        ),
      ),
    );
  }
}
