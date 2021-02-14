import 'package:alergo/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductLabels extends StatelessWidget {
  const ProductLabels({
    Key key,
    @required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: product.labels.length,
          itemBuilder: (BuildContext context, int index) {
            return Tooltip(
              message: product.labels[index].description,
              child: Container(
                  constraints: BoxConstraints(
                      minHeight: 100,
                      minWidth: MediaQuery.of(context).size.width * 0.22),
                  child: Center(
                    child: Image.asset(product.labels[index].assetPath,
                        height: 80, width: 80),
                  )),
            );
          }),
    );
  }
}
