import 'package:alergo/mocks/users_mock.dart';
import 'package:alergo/models/profile_item_model.dart';
import 'package:flutter/widgets.dart';

class UserModel {
  final List<ProfileItemModel> forbiddenIngredients;
  final List<ProfileItemModel> compatibleIngredients;
  final List<ProfileItemModel> uncompatibleIngredients;

  UserModel({
    @required this.forbiddenIngredients,
    @required this.compatibleIngredients,
    @required this.uncompatibleIngredients,
  });

  bool isNotSet() {
    return forbiddenIngredients.isEmpty &&
        compatibleIngredients.isEmpty &&
        uncompatibleIngredients.isEmpty;
  }

  UserModel.fromMap(Map<String, dynamic> json)
      : forbiddenIngredients = json['forbiddenIngredients']
            .map<ProfileItemModel>((model) => ProfileItemModel.fromMap(model))
            .toList(),
        compatibleIngredients = json['compatibleIngredients']
            .map<ProfileItemModel>((model) => ProfileItemModel.fromMap(model))
            .toList(),
        uncompatibleIngredients = json['uncompatibleIngredients']
            .map<ProfileItemModel>((model) => ProfileItemModel.fromMap(model))
            .toList();

  Map<String, dynamic> toMap() => {
        "forbiddenIngredients": List<ProfileItemModel>.from(
            forbiddenIngredients.map((i) => i.toMap())),
        "compatibleIngredients": List<ProfileItemModel>.from(
            compatibleIngredients.map((i) => i.toMap())),
        "uncompatibleIngredients": List<ProfileItemModel>.from(
            uncompatibleIngredients.map((i) => i.toMap())),
      };

  static List<UserModel> fromMock() =>
      USERS_MOCK.map((model) => UserModel.fromMap(model)).toList();
}
