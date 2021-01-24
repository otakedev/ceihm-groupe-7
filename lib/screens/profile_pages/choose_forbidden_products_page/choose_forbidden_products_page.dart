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
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05)
              .copyWith(bottom: 0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  "Je ne mange pas",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Flexible(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing:
                          MediaQuery.of(context).size.width * 0.05,
                      mainAxisSpacing:
                          MediaQuery.of(context).size.height * 0.02,
                    ),
                    shrinkWrap: true,
                    itemCount: diets.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemBlock(
                        itemName: diets[index].itemName,
                        assetPath: diets[index].assetPath,
                        index: index,
                        type: ProfileType.DIET,
                      );
                    }),
              ),
            ],
          ),
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
