import 'package:alergo/components/title_bar.dart';
import 'package:alergo/core/text_style.dart';
import 'package:alergo/models/ingredient_model.dart';
import 'package:alergo/models/product_model.dart';
import 'package:alergo/screens/product_page/components/product_compatibility.dart';
import 'package:alergo/screens/product_page/components/product_ingredients.dart';
import 'package:alergo/screens/product_page/components/product_labels.dart';
import 'package:alergo/screens/product_page/components/product_origin.dart';
import 'package:alergo/screens/product_page/components/similar_products.dart';
import 'package:alergo/theme/colors.dart';
import 'package:alergo/theme/style.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    this.product,
    this.color = colorPrimary,
    this.forEachCheckValidity,
    this.compatibilityWidget,
    Key key,
  })  : assert(forEachCheckValidity != null),
        assert(product != null),
        super(key: key);

  final ProductModel product;
  final Color color;
  final Widget compatibilityWidget;
  final ValidityState Function(IngredientModel ingredient) forEachCheckValidity;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
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
              child: Hero(
                tag: product.id,
                child: Image.network(
                  product.urlImage,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        SliverRoundedBorderValidity(
          color: color,
          compatibilityWidget: compatibilityWidget,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              TitleBar(title: 'Liste des ingrédients'),
              ProductIngredients(
                product: product,
                forEachCheckValidity: forEachCheckValidity,
              ),
              SimilarProductsSection(product: product),
              TitleBar(title: 'Label${product.labels.length > 0 ? 's' : ''}'),
              ProductLabels(labels: product.labels),
              TitleBar(title: 'Provenance'),
              ProductOrigin(product: product),
            ],
          ),
        )
      ],
    );
  }
}

class SliverRoundedBorderValidity extends StatelessWidget {
  const SliverRoundedBorderValidity({
    Key key,
    @required this.color,
    @required this.compatibilityWidget,
  }) : super(key: key);

  final Color color;
  final Widget compatibilityWidget;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          Container(color: color, width: double.infinity, height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                topRight: Radius.circular(borderRadius),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                color: color,
              ),
              child: compatibilityWidget ?? const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
