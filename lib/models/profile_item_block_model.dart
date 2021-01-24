import 'package:flutter/widgets.dart';

class ProfileItemBlockModel {
  final String itemName;
  final String assetPath;

  ProfileItemBlockModel({@required this.itemName, @required this.assetPath})
      : assert(itemName != null),
        assert(assetPath != null);

  ProfileItemBlockModel.fromMap(Map<String, dynamic> json)
      : itemName = json['itemName'],
        assetPath = json['assetPath'];

  Map<String, dynamic> toMap() =>
      {"itemName": itemName, "assetPath": assetPath};
}
