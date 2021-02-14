import 'package:alergo/core/text_style.dart';
import 'package:alergo/models/product_model.dart';
import 'package:alergo/theme/style.dart';
import 'package:flutter/material.dart';

class ProductOrigin extends StatelessWidget {
  const ProductOrigin({
    Key key,
    @required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8, right: 8, bottom: 20),
      constraints: BoxConstraints(minHeight: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.5,
            blurRadius: 1,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            constraints: BoxConstraints(minHeight: 40),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(product.origin.assetPath),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                product.origin.name,
                style: bodyText2Black(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}