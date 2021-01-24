import 'package:alergo/core/text_style.dart';
import 'package:alergo/models/product_model.dart';
import 'package:alergo/screens/product_page/components/product_ingredients.dart';
import 'package:alergo/theme/colors.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    this.product,
    this.color = colorPrimary,
    Key key,
  })  : assert(product != null),
        super(key: key);

  final ProductModel product;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            leading: BackButton(
              color: colorWhite,
            ),
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            backgroundColor: this.color,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                product.name,
                style: bodyText1White(context),
              ),
              background: Padding(
                padding: EdgeInsets.all(50),
                child: Image.network(
                  product.urlImage,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ];
      },
      body: Container(
        color: color,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          child: ProductIngredients(product: product, color: color),
        ),
      ),
    );
  }
}

