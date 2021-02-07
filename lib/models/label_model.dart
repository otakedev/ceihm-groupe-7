import 'package:alergo/models/profile_item_model.dart';
import 'package:flutter/material.dart';

class LabelModel extends ProfileItemModel {
  final String description;

  LabelModel({
    @required assetPath,
    @required name,
    @required id,
    this.description,
  }) : super(assetPath: assetPath, name: name, id: id);

  LabelModel.fromMap(Map<String, dynamic> json)
      : description = json['description'],
        super.fromMap(json);

  Map<String, dynamic> toMap() => {
        "description": description,
        ...super.toMap(),
      };
}
