import 'package:alergo/mocks/diets_mock.dart';
import 'package:alergo/models/ingredient_model.dart';
import 'package:alergo/models/profile_item_model.dart';
import 'package:flutter/widgets.dart';

class DietModel extends ProfileItemModel {
  final List<IngredientModel> forbiddenIngredients;
  final List<IngredientModel> compatibleIngredients;
  final List<IngredientModel> uncompatibleIngredients;

  DietModel({
    this.forbiddenIngredients = const [],
    this.compatibleIngredients = const [],
    this.uncompatibleIngredients = const [],
    @required assetPath,
    @required name,
    @required id,
  }) : super(assetPath: assetPath, name: name, id: id);

  DietModel.fromMap(Map<String, dynamic> json)
      : forbiddenIngredients =
            DietModel.mapToList(json['forbiddenIngredients']),
        compatibleIngredients =
            DietModel.mapToList(json['compatibleIngredients']),
        uncompatibleIngredients =
            DietModel.mapToList(json['uncompatibleIngredients']),
        super.fromMap(json);

  Map<String, dynamic> toMap() => {
        "forbiddenIngredients": List<IngredientModel>.from(
            forbiddenIngredients.map((i) => i.toMap())),
        "compatibleIngredients": List<IngredientModel>.from(
            compatibleIngredients.map((i) => i.toMap())),
        "uncompatibleIngredients": List<IngredientModel>.from(
            uncompatibleIngredients.map((i) => i.toMap())),
        ...super.toMap(),
      };

  static List<IngredientModel> mapToList(json) => json
      .map<IngredientModel>((model) => IngredientModel.fromMap(model))
      .toList();

  static List<DietModel> fromMock() =>
      DIETS_MOCK.map((model) => DietModel.fromMap(model)).toList();
}
