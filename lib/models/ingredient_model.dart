import 'package:flutter/widgets.dart';

class IngredientModel {
  final String quantity;
  final String name;
  final int id;

  IngredientModel(
      {@required this.quantity, @required this.name, @required this.id})
      : assert(name != null),
        assert(quantity != null),
        assert(id != null);

  IngredientModel.fromMap(Map<String, dynamic> json)
      : quantity = json['quantity'],
        id = json['id'],
        name = json['name'];

  Map<String, dynamic> toMap() => {
        "quantity": quantity,
        "name": name,
        "id": id,
      };
}
