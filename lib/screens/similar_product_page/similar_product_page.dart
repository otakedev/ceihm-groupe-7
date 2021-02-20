import 'package:alergo/models/product_model.dart';
import 'package:alergo/screens/product_page/product_page.dart';
import 'package:alergo/screens/similar_product_page/components/similar_item_product.dart';
import 'package:flutter/material.dart';

class SimilarProductPage extends StatelessWidget {
  static const String routeName = '/similar-product';
  const SimilarProductPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> similarProducts =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Les produits similaires",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: similarProducts.length,
            itemBuilder: (BuildContext context, int index) {
              return SimilarItemProduct(product: similarProducts[index]);
            },
          ),
        ),
      ),
      floatingActionButton: QuickActionsFloatingButtons(),
    );
  }
}
