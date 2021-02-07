import 'package:alergo/models/profile_item_model.dart';
import 'package:flutter/material.dart';

class OriginModel extends ProfileItemModel {
  final String city;

  OriginModel({
    @required assetPath,
    @required name,
    @required id,
    this.city,
  }) : super(assetPath: assetPath, name: name, id: id);

  OriginModel.fromMap(Map<String, dynamic> json)
      : city = json['city'],
        super.fromMap(json);

  Map<String, dynamic> toMap() => {
        "city": city,
        ...super.toMap(),
      };
}
