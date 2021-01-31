import 'package:alergo/core/text_style.dart';
import 'package:alergo/models/product_model.dart';
import 'package:alergo/theme/style.dart';
import 'package:alergo/models/user_model.dart';
import 'package:alergo/screens/product_page/components/product_details.dart';
import 'package:flutter/material.dart';
import 'package:alergo/theme/colors.dart';

class ProductIngredients extends StatelessWidget {
  const ProductIngredients({
    Key key,
    @required this.product,
    this.user,
    this.dictionary,
    this.computeFunction,
  }) : super(key: key);

  final ProductModel product;
  final dictionary;
  final UserModel user;
  final StringStateCallback computeFunction;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            constraints: BoxConstraints(minHeight: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              color: colorSecondary,
            ),
            child: Center(
              child:
                  Text('Liste des Ingrédients', style: bodyText1Black(context)),
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: product.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 20),
                    constraints: BoxConstraints(minHeight: 40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.all(Radius.circular(borderRadius)),
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
                            color: this.dictionary[this.computeFunction(
                                    [product.ingredients[index]], this.user)]
                                ["color"],
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Center(
                              child: Text(product.ingredients[index].quantity,
                                  style: bodyText2White(context))),
                        ),
                        Expanded(
                            child: Center(
                                child: Text(product.ingredients[index].name,
                                    style: bodyText2Black(context)))),
                        Container(
                          height: 40,
                          margin: EdgeInsets.only(right: 6),
                          child: Center(
                            child: Icon(
                              this.dictionary[this.computeFunction(
                                      [product.ingredients[index]], this.user)]
                                  ["icon"],
                              size: 30,
                              color: this.dictionary[this.computeFunction(
                                      [product.ingredients[index]], this.user)]
                                  ["color"],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
