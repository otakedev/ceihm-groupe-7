import 'package:flutter/widgets.dart';
import 'package:quiver/core.dart';

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

  static List<ProfileItemBlockModel> fromMock(List json) =>
      json.map((model) => ProfileItemBlockModel.fromMap(model)).toList();

  bool operator ==(o) =>
      o is ProfileItemBlockModel &&
      itemName == o.itemName &&
      assetPath == o.assetPath;

  int get hashCode => hash2(itemName.hashCode, assetPath.hashCode);
}
