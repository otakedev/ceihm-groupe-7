// Flutter
import 'dart:developer';

import 'package:alergo/screens/profile_pages/choose_forbidden_products_page/choose_forbidden_products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Internal
import 'package:alergo/core/router.dart';

// Pages
import '../end_of_profile_form_page/end_of_profile_form_page.dart';

class ChooseUnlikedProductsPage extends StatefulWidget {
  @override
  _ChooseUnlikedProductsPageState createState() =>
      _ChooseUnlikedProductsPageState();
}

class _ChooseUnlikedProductsPageState extends State<ChooseUnlikedProductsPage> {
  List<int> selectedIndexes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => log("cancel pressed"),
          icon: Icon(Icons.cancel),
        ),
        title: Text("Je n'aime pas"),
      ),
      body: Container(child: Text('the list goes here')),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            FlatButton(
              onPressed: () =>
                  navigateToPage(context, ChooseForbiddenProductsPage()),
              child: Text("< Je ne peux pas"),
            ),
            Spacer(),
            RaisedButton(
              onPressed: () => navigateToPage(context, EndOfProfileFormPage()),
              child: Text("Terminer"),
            ),
          ],
        ),
      ),
    );
  }
}
