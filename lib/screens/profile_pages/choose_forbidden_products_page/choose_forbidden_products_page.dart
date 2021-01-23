// Flutter
import 'dart:developer';
import 'package:alergo/components/item_block.dart';
import 'package:alergo/mocks/profil_items_mock.dart';
import 'package:alergo/models/profile_item_block_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Internal
import 'package:alergo/core/router.dart';

// Pages
import '../choose_unliked_products_page/choose_unliked_products_page.dart';
import 'package:alergo/screens/profile_pages/choose_diet_page/choose_diet_page.dart';

import '../profile_page.dart';

class ChooseForbiddenProductsPage extends StatelessWidget {
  final VoidCallback goToNextPage;
  final VoidCallback goToPreviousPage;
  const ChooseForbiddenProductsPage(
      {Key key, @required this.goToNextPage, @required this.goToPreviousPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProfileItemBlockModel> diets = FORBIDDEN_ITEMS_MOCK
        .map((e) => ProfileItemBlockModel.fromMap(e))
        .toList();
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.09),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: MediaQuery.of(context).size.width * 0.09,
                mainAxisSpacing: MediaQuery.of(context).size.height * 0.04,
              ),
              shrinkWrap: true,
              itemCount: diets.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemBlock(
                  itemName: diets[index].itemName,
                  assetPath: diets[index].assetPath,
                  index: index,
                  type: ProfileType.FORBIDDEN_PRODUCT,
                );
              }),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            FlatButton(
              onPressed: () => goToPreviousPage(),
              child: Text("< Choix du régime"),
            ),
            Spacer(),
            RaisedButton(
              onPressed: () => goToNextPage(),
              child: Text("Suivant"),
            ),
          ],
        ),
      ),
    );
  }
}
