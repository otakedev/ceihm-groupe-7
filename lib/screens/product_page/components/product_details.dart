import 'package:alergo/core/text_style.dart';
import 'package:alergo/models/product_model.dart';
import 'package:alergo/screens/product_page/components/product_ingredients.dart';
import 'package:alergo/theme/colors.dart';
import 'package:alergo/theme/style.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    this.product,
    this.color = colorPrimary,
    this.icon,
    this.compatibilityTitle,
    Key key,
  })  : assert(product != null),
        super(key: key);

  final ProductModel product;
  final Color color;
  final IconData icon;
  final String compatibilityTitle;

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
              topLeft: Radius.circular(borderRadius),
              topRight: Radius.circular(borderRadius),
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                constraints: BoxConstraints(minHeight: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                  color: color,
                ),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Container(
                        height: 50,
                        child: Center(
                          child: Text(
                            this.compatibilityTitle,
                            style: headline4White(context),
                          ),
                        ),
                      )),
                      Container(
                        height: 50,
                        margin: EdgeInsets.only(right: 6),
                        child: Center(
                          child: Icon(
                            this.icon,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ProductIngredients(product: product, color: color),
            ],
          ),
        ),
      ),
    );
  }
}
