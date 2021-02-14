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
    switch (this.product.name) {
      case "Coca Cola":
        return allProducts
            .where((product) => product.name == "Coca Cola Zéro")
            .toList();
        break;
      case "Coca Cola Zéro":
        return allProducts
            .where((product) => product.name == "Coca Cola")
            .toList();
        break;
      default:
        return new List<ProductModel>();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> similarProducts = this.getSimilarProducts();
    if (similarProducts.isNotEmpty) {
      return Wrap(
        children: [
          TitleBar(title: 'Bonne nouvelle !'),
          Text(
              "Nous avons trouvé un ou plusieurs articles similaires respectant votre profil !"),
          ElevatedButton.icon(
            label: Text("Voir les articles similaires"),
            icon: Icon(
              Icons.filter_none,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SimilarProductPage(similarProducts: similarProducts)),
              );
            },
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
