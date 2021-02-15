import 'dart:developer';

import 'package:alergo/components/title_bar.dart';
import 'package:alergo/core/router.dart';
import 'package:alergo/models/product_model.dart';
import 'package:alergo/screens/similar_product_page/similar_product_page.dart';
import 'package:flutter/material.dart';

class SimilarProductsSection extends StatelessWidget {
  const SimilarProductsSection({
    Key key,
    @required this.product,
  }) : super(key: key);

  final ProductModel product;
  static List<ProductModel> allProducts = ProductModel.fromMock();

  List<ProductModel> getSimilarProducts() {
    const COLA_NAME = "cola";
    if (this.product.name.toLowerCase().contains(COLA_NAME)) {
      return allProducts
          .where((product) => (product.name.toLowerCase().contains(COLA_NAME) &&
              product.id != this.product.id))
          .toList();
    } else {
      return new List<ProductModel>();
    }
  }

  @override
  Widget build(BuildContext context) {
    log(allProducts.toString());
    List<ProductModel> similarProducts = this.getSimilarProducts();
    if (similarProducts.isNotEmpty) {
      return Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Wrap(
          children: [
            TitleBar(title: 'Produits similaires'),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 15),
              child: Text(
                  "Nous avons trouvé un ou plusieurs articles similaires respectant votre profil !"),
            ),
            Center(
              child: ElevatedButton.icon(
                label: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text("Voir les articles similaires"),
                ),
                icon: Icon(
                  Icons.filter_none,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SimilarProductPage(
                            similarProducts: similarProducts)),
                  );
                },
              ),
            )
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
