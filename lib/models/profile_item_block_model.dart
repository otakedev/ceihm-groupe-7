import 'package:flutter/widgets.dart';
import 'package:quiver/core.dart';

class ProfileItemBlockModel {
  final String itemName;
  final String assetPath;
  final int id;

  ProfileItemBlockModel(
      {@required this.itemName, @required this.assetPath, @required this.id})
      : assert(itemName != null),
        assert(assetPath != null),
        assert(id != null);

  ProfileItemBlockModel.fromMap(Map<String, dynamic> json)
      : itemName = json['itemName'],
        assetPath = json['assetPath'],
        id = json['id'];

  Map<String, dynamic> toMap() =>
      {"itemName": itemName, "assetPath": assetPath, "id": id};

  static List<ProfileItemBlockModel> fromMock(List json) =>
      json.map((model) => ProfileItemBlockModel.fromMap(model)).toList();

  bool operator ==(o) =>
      o is ProfileItemBlockModel &&
      itemName == o.itemName &&
      assetPath == o.assetPath &&
      id == o.id;

  int get hashCode => hash3(itemName.hashCode, assetPath.hashCode, id.hashCode);
}
