import 'package:alergo/mocks/users_mock.dart';
import 'package:alergo/models/profile_item_block_model.dart';
import 'package:flutter/widgets.dart';

class UserModel {
  final List<ProfileItemBlockModel> forbiddenIngredients;
  final List<ProfileItemBlockModel> likedIngredients;
  final List<ProfileItemBlockModel> unlikedIngredients;

  UserModel({
    @required this.forbiddenIngredients,
    @required this.likedIngredients,
    @required this.unlikedIngredients,
  });

  UserModel.fromMap(Map<String, dynamic> json)
      : forbiddenIngredients = json['forbiddenIngredients']
            .map<ProfileItemBlockModel>(
                (model) => ProfileItemBlockModel.fromMap(model))
            .toList(),
        likedIngredients = json['likedIngredients']
            .map<ProfileItemBlockModel>(
                (model) => ProfileItemBlockModel.fromMap(model))
            .toList(),
        unlikedIngredients = json['unlikedIngredients']
            .map<ProfileItemBlockModel>(
                (model) => ProfileItemBlockModel.fromMap(model))
            .toList();

  Map<String, dynamic> toMap() => {
        "forbiddenIngredients": List<ProfileItemBlockModel>.from(
            forbiddenIngredients.map((i) => i.toMap())),
        "likedIngredients": List<ProfileItemBlockModel>.from(
            likedIngredients.map((i) => i.toMap())),
        "unlikedIngredients": List<ProfileItemBlockModel>.from(
            unlikedIngredients.map((i) => i.toMap())),
      };

  static List<UserModel> fromMock() =>
      USERS_MOCK.map((model) => UserModel.fromMap(model)).toList();
}
