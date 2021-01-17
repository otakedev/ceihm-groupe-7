import 'package:flutter/widgets.dart';

class ProductModel {
  final String name;
  final String description;
  final String urlImage;

  ProductModel(
      {@required this.name,
      @required this.description,
      @required this.urlImage})
      : assert(name != null, description != null);

  ProductModel.fromMap(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'],
        urlImage = json['urlImage'];

  Map<String, dynamic> toMap() => {
        "name": name,
        "description": description,
        "urlImage": urlImage,
      };
}
