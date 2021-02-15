import 'package:alergo/core/text_style.dart';
import 'package:alergo/models/ingredient_model.dart';
import 'package:alergo/models/product_model.dart';
import 'package:alergo/screens/product_page/components/product_compatibility.dart';
import 'package:alergo/screens/product_page/components/product_profile_menu.dart';
import 'package:alergo/theme/colors.dart';
import 'package:alergo/theme/style.dart';
import 'package:flutter/material.dart';

class ProductIngredients extends StatelessWidget {
  const ProductIngredients({
    Key key,
    @required this.product,
    @required this.forEachCheckValidity,
  })  : assert(product != null),
        assert(forEachCheckValidity != null),
        super(key: key);

  final ProductModel product;
  final ValidityState Function(IngredientModel ingredient) forEachCheckValidity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(children: [
        for (IngredientModel ingredient in product.ingredients)
          IngredientItem(
            validity: forEachCheckValidity(ingredient),
            ingredient: ingredient,
          ),
      ]),
    );
  }
}

class IngredientItem extends StatelessWidget {
  const IngredientItem({
    Key key,
    @required this.validity,
    @required this.ingredient,
  }) : super(key: key);

  final ValidityState validity;
  final IngredientModel ingredient;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
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
            padding: EdgeInsets.only(left: 10, right: 10),
            constraints: BoxConstraints(minHeight: 40, minWidth: 100),
            decoration: BoxDecoration(
              color: validity.color,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  validity.icon,
                  size: 30,
                  color: colorWhite,
                ),
                SizedBox(width: 10),
                Text(
                  ingredient.quantity,
                  style: bodyText2White(context),
                ),
              ],
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Text(
              ingredient.name,
              style: bodyText2Black(context),
            ),
          ),
          ProductProfileMenu(
            ingredient: ingredient,
            currentValidity: validity.state,
          ),
        ],
      ),
    );
  }
}
