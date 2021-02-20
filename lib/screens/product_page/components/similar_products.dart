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

  bool currentProductIsCompatibleWith(ProductModel product) {
    const LOW_SUGAR_KEY_WORD = "light";
    const ZERO_SUGAR_KEY_WORD = "zéro";

    return (product.name.toLowerCase().contains(LOW_SUGAR_KEY_WORD) ||
            product.name.toLowerCase().contains(ZERO_SUGAR_KEY_WORD)) &&
        product.id != this.product.id;
  }

  /// This function assumes that the user does not like sugar and works with coca cola products.
  List<ProductModel> getSimilarProducts() {
    const COLA_NAME = "cola";

    if (this.product.name.toLowerCase().contains(COLA_NAME)) {
      return allProducts
          .where((product) => currentProductIsCompatibleWith(product))
          .toList();
    } else {
      return new List<ProductModel>();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> similarProducts = this.getSimilarProducts();
    if (similarProducts.isNotEmpty) {
      return Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            TitleBar(title: 'Bonne nouvelle !'),
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
                onPressed: () => navigateToRoute(
                  context,
                  SimilarProductPage.routeName,
                  replace: true,
                  arguments: similarProducts,
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
