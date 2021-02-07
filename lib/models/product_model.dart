import 'package:alergo/mocks/products_mock.dart';
import 'package:alergo/models/ingredient_model.dart';
import 'package:alergo/models/label_model.dart';
import 'package:flutter/widgets.dart';

class ProductModel {
  final String id;
  final String name;
  final String description;
  final String urlImage;
  final List<IngredientModel> ingredients;
  final List<LabelModel> labels;

  ProductModel({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.urlImage,
    @required this.ingredients,
    @required this.labels,
  })  : assert(name != null),
        assert(id != null),
        assert(ingredients != null),
        assert(labels != null),
        assert(description != null);

  ProductModel.fromMap(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        urlImage = json['urlImage'],
        ingredients = json['ingredients']
            .map<IngredientModel>((model) => IngredientModel.fromMap(model))
            .toList(),
        labels = json['labels']
            .map<LabelModel>((model) => LabelModel.fromMap(model))
            .toList();

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "urlImage": urlImage,
        "ingredients":
            List<IngredientModel>.from(ingredients.map((i) => i.toMap())),
        "labels": List<LabelModel>.from(labels.map((i) => i.toMap())),
      };

  static List<ProductModel> fromMock() =>
      PRODUCTS_MOCK.map((model) => ProductModel.fromMap(model)).toList();
}
