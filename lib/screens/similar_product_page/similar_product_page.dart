import 'package:alergo/models/product_model.dart';
import 'package:alergo/screens/product_page/product_page.dart';
import 'package:alergo/screens/similar_product_page/components/similar_item_product.dart';
import 'package:flutter/material.dart';

class SimilarProductPage extends StatelessWidget {
  static const String routeName = '/similar-product';
  const SimilarProductPage({Key key}) : super(key: key);

  static List<ProductModel> products = ProductModel.fromMock();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Les produits similaires",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return SimilarItemProduct(product: products[index]);
              },
            ),
          ),
        ),
      ),
      floatingActionButton: QuickSearchTools(),
    );
  }
}
