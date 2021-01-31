import 'package:alergo/mocks/users_mock.dart';
import 'package:alergo/models/profile_item_block_model.dart';
import 'package:flutter/widgets.dart';

class UserModel {
  final String id;
  final String name;
  final List<ProfileItemBlockModel> forbiddenIngredients;
  final List<ProfileItemBlockModel> likedIngredients;
  final List<ProfileItemBlockModel> unlikedIngredients;

  UserModel({
    @required this.id,
    @required this.name,
    @required this.forbiddenIngredients,
    @required this.likedIngredients,
    @required this.unlikedIngredients,
  })  : assert(name != null),
        assert(id != null);

  UserModel.fromMap(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        forbiddenIngredients = json['forbiddenIngredients']
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
        "id": id,
        "name": name,
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
