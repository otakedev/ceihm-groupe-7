import 'package:flutter/widgets.dart';
import 'package:quiver/core.dart';

class ProfileItemModel {
  final String name;
  final String assetPath;
  final int id;

  ProfileItemModel({
    @required this.name,
    @required this.assetPath,
    @required this.id,
  })  : assert(name != null),
        assert(assetPath != null),
        assert(id != null);

  ProfileItemModel.fromMap(Map<String, dynamic> json)
      : name = json['name'],
        assetPath = json['assetPath'],
        id = json['id'];

  Map<String, dynamic> toMap() => {
        "name": name,
        "assetPath": assetPath,
        "id": id,
      };

  static List<ProfileItemModel> fromMock(List json) =>
      json.map((model) => ProfileItemModel.fromMap(model)).toList();

  bool operator ==(o) =>
      o is ProfileItemModel &&
      name == o.name &&
      assetPath == o.assetPath &&
      id == o.id;

  int get hashCode => hash3(name.hashCode, assetPath.hashCode, id.hashCode);
}
