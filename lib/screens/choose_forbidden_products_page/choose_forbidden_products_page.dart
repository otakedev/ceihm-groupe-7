// Flutter
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Internal
import 'package:alergo/core/router.dart';
import 'package:alergo/components/item_block.dart';

// Pages
import '../choose_unliked_products_page/choose_unliked_products_page.dart';

class ChooseForbiddenProductPage extends StatefulWidget {
  @override
  _ChooseForbiddenProductPageState createState() =>
      _ChooseForbiddenProductPageState();
}

class _ChooseForbiddenProductPageState
    extends State<ChooseForbiddenProductPage> {
  List<int> selectedIndexes = [];
  // List<ProductItemModel> diets =
  //     PRODUCT_ITEMS_MOCK.map((e) => new ProductItemModel.fromMap(e)).toList(); // TODO

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.09),
            child: Column(
              children: [
                GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing:
                          MediaQuery.of(context).size.width * 0.09,
                      mainAxisSpacing:
                          MediaQuery.of(context).size.height * 0.04,
                    ),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemBlock(
                        itemName: "product",
                        assetPath: "assets/diets/vegan.jpg",
                        index: index,
                        isSelected: selectedIndexes.contains(index),
                        onSelect: () {
                          setState(() {
                            selectedIndexes.add(index);
                          });
                        },
                        onDeselect: () {
                          setState(() {
                            if (selectedIndexes.contains(index)) {
                              selectedIndexes
                                  .removeWhere((element) => element == index);
                            }
                          });
                        },
                      );
                    }),
                RaisedButton(
                  onPressed: () =>
                      navigateToPage(context, ChooseUnlikedProductsPage()),
                  child: Text("Suivant"),
                ),
              ],
            )),
      ),
    );
  }
}
