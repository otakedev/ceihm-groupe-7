import 'package:alergo/mocks/ingredients_mock.dart';
import 'package:alergo/models/profile_item_model.dart';
import 'package:flutter/widgets.dart';

class IngredientModel extends ProfileItemModel {
  final String quantity;

  IngredientModel({
    @required assetPath,
    @required name,
    @required id,
    this.quantity,
  }) : super(assetPath: assetPath, name: name, id: id);

  IngredientModel.fromMap(Map<String, dynamic> json)
      : quantity = json['quantity'],
        super.fromMap(json);

  Map<String, dynamic> toMap() => {
        "quantity": quantity,
        ...super.toMap(),
      };

  static List<IngredientModel> fromMock() =>
      INGREDIENTS_MOCK.map((model) => IngredientModel.fromMap(model)).toList();
}
