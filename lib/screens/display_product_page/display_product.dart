import 'package:alergo/core/text_style.dart';
import 'package:alergo/mocks/products_mock.dart';
import 'package:alergo/models/product_model.dart';
import 'package:alergo/theme/colors.dart';
import 'package:alergo/theme/hexcolor.dart';
import 'package:flutter/material.dart';

class DisplayProduct extends StatelessWidget {
  DisplayProduct();

  ProductModel product = ProductModel.fromMap(PRODUCTS_MOCK[1]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorValid,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              backgroundColor: kColorValid,
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
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          child: Center(child: Text(product.description)),
        ),
      ),
    );
  }
}
