import 'package:alergo/mocks/products_mock.dart';
import 'package:flutter/widgets.dart';

class ProductModel {
  final String id;
  final String name;
  final String description;
  final String urlImage;

  ProductModel({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.urlImage,
  })  : assert(name != null),
        assert(id != null),
        assert(description != null);

  ProductModel.fromMap(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        urlImage = json['urlImage'];

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "urlImage": urlImage,
      };

  static List<ProductModel> fromMock() =>
      PRODUCTS_MOCK.map((model) => ProductModel.fromMap(model)).toList();
}
