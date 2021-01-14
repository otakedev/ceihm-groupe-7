import 'package:flutter/widgets.dart';

class DietItemModel {
  final String itemName;
  final String assetPath;

  DietItemModel({@required this.itemName, @required this.assetPath})
      : assert(itemName != null),
        assert(assetPath != null);

  DietItemModel.fromMap(Map<String, dynamic> json)
      : itemName = json['itemName'],
        assetPath = json['assetPath'];

  Map<String, dynamic> toMap() =>
      {"itemName": itemName, "assetPath": assetPath};
}
