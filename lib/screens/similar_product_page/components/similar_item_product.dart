import 'package:alergo/core/router.dart';
import 'package:alergo/models/product_model.dart';
import 'package:alergo/screens/product_page/product_page.dart';
import 'package:alergo/theme/colors.dart';
import 'package:alergo/theme/style.dart';
import 'package:flutter/material.dart';

class SimilarItemProduct extends StatelessWidget {
  const SimilarItemProduct({Key key, @required this.product}) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => {
          navigateToRoute(
            context,
            ProductPage.routeName,
            replace: true,
            arguments: product,
          )
        },
        child: Container(
          decoration: BoxDecoration(
              color: colorPrimary,
              borderRadius: BorderRadius.circular(borderRadius)),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${product.name}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Divider(
                          thickness: 2,
                          endIndent: MediaQuery.of(context).size.width * 0.4,
                          color: Colors.white,
                        ),
                        Text(
                          "${product.description}",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Hero(
                      tag: product.id,
                      child: Image.asset(product.urlImage, fit: BoxFit.contain),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
