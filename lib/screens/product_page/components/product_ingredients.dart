import 'package:alergo/core/text_style.dart';
import 'package:alergo/models/ingredient_model.dart';
import 'package:alergo/models/product_model.dart';
import 'package:alergo/screens/product_page/components/product_compatibility.dart';
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
        margin: const EdgeInsets.all(8),
        child: Column(children: getIngredientList(product, context)));
  }

  List<Widget> getIngredientList(ProductModel product, context) {
    List<Widget> list = new List<Widget>();
    for (var index = 0; index < product.ingredients.length; index++) {
      var validity = forEachCheckValidity(product.ingredients[index]);
      list.add(Container(
        margin: EdgeInsets.only(bottom: 20),
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
              child: Center(
                child: Text(
                  product.ingredients[index].quantity,
                  style: bodyText2White(context),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  product.ingredients[index].name,
                  style: bodyText2Black(context),
                ),
              ),
            ),
            Container(
              height: 40,
              margin: EdgeInsets.only(right: 6),
              child: Center(
                child: Icon(
                  validity.icon,
                  size: 30,
                  color: validity.color,
                ),
              ),
            ),
          ],
        ),
      ));
    }
    return list;
  }
}
