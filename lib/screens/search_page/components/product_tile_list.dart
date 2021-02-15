import 'package:alergo/models/product_model.dart';
import 'package:alergo/theme/colors.dart';
import 'package:alergo/theme/style.dart';
import 'package:flutter/material.dart';

class ProductTileList extends StatelessWidget {
  const ProductTileList({
    this.product,
    this.onTap,
    Key key,
  })  : assert(product != null),
        super(key: key);

  final ProductModel product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: colorWhite,
      borderRadius: BorderRadius.circular(borderRadius),
      elevation: 4.0,
      child: ListTile(
        leading: Hero(
          tag: product.id,
          child: Image.asset(product.urlImage, fit: BoxFit.contain),
        ),
        title: Text(product.name),
        subtitle: Text(product.description),
        onTap: onTap ?? () {},
      ),
    );
  }
}
