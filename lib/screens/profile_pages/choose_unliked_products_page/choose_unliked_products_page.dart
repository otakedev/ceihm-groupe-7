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
import 'package:alergo/screens/profile_pages/choose_forbidden_products_page/choose_forbidden_products_page.dart';
import '../end_of_profile_form_page/end_of_profile_form_page.dart';
import '../profile_page.dart';

class ChooseUnlikedProductsPage extends StatelessWidget {
  final VoidCallback goToNextPage;
  final VoidCallback goToPreviousPage;
  const ChooseUnlikedProductsPage(
      {Key key, @required this.goToNextPage, @required this.goToPreviousPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProfileItemBlockModel> diets = UNLIKED_ITEMS_MOCK
        .map((e) => new ProfileItemBlockModel.fromMap(e))
        .toList();
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     onPressed: () => log("cancel pressed"),
      //     icon: Icon(Icons.cancel),
      //   ),
      //   title: Text("Je n'aime pas"),
      // ),
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
                  type: ProfileType.UNLIKED_PRODUCT,
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
              child: Text("< Je ne peux pas"),
            ),
            Spacer(),
            RaisedButton(
              onPressed: () => goToNextPage(),
              child: Text("Terminer"),
            ),
          ],
        ),
      ),
    );
  }
}
