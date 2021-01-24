import 'package:flutter/widgets.dart';

class IngredientModel {
  final String quantity;
  final String name;

  IngredientModel({@required this.quantity, @required this.name})
      : assert(name != null),
        assert(quantity != null);

  IngredientModel.fromMap(Map<String, dynamic> json)
      : quantity = json['quantity'],
        name = json['name'];

  Map<String, dynamic> toMap() => {
        "quantity": quantity,
        "name": name,
      };
}
