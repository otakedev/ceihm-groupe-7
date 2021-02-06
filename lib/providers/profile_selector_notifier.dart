import 'package:alergo/models/diet_model.dart';
import 'package:alergo/models/profile_item_model.dart';
import 'package:alergo/models/user_model.dart';
import 'package:flutter/material.dart';

class ProfileSelectorNotifier with ChangeNotifier {
  List<ProfileItemModel> _selectedDiet = [];
  List<ProfileItemModel> _selectedForbiddenProduct = [];
  List<ProfileItemModel> _selectedUnlikedProduct = [];

  ProfileItemModel _lastRemovedChoice;
  ProfileType _lastProfileType;

  List<ProfileItemModel> get selectedDiet => _selectedDiet;
  List<ProfileItemModel> get selectedForbiddenProduct =>
      _selectedForbiddenProduct;
  List<ProfileItemModel> get selectedUnlikedProduct => _selectedUnlikedProduct;

  bool isSelected(ProfileItemModel model, ProfileType type) {
    switch (type) {
      case ProfileType.DIET:
        return _selectedDiet.contains(model);
      case ProfileType.FORBIDDEN_PRODUCT:
        return _selectedForbiddenProduct.contains(model);
      case ProfileType.UNLIKED_PRODUCT:
        return _selectedUnlikedProduct.contains(model);
    }
    return false;
  }

  addElement(ProfileItemModel model, ProfileType type) {
    switch (type) {
      case ProfileType.DIET:
        _selectedDiet.add(model);
        _selectedForbiddenProduct.addAll(
          ((model as DietModel).forbiddenIngredients),
        );
        break;
      case ProfileType.FORBIDDEN_PRODUCT:
        _selectedForbiddenProduct.add(model);
        break;
      case ProfileType.UNLIKED_PRODUCT:
        _selectedUnlikedProduct.add(model);
        break;
    }
    notifyListeners();
  }

  removeElement(ProfileItemModel model, ProfileType type) {
    switch (type) {
      case ProfileType.DIET:
        _selectedDiet.removeWhere((element) => element == model);
        (model as DietModel)
            .forbiddenIngredients
            .forEach((e) => _selectedForbiddenProduct.remove(e));

        break;
      case ProfileType.FORBIDDEN_PRODUCT:
        _selectedForbiddenProduct.remove(model);
        break;
      case ProfileType.UNLIKED_PRODUCT:
        _selectedUnlikedProduct.remove(model);
        break;
    }
    notifyListeners();
  }

  removeElementById(int index, ProfileType type) {
    switch (type) {
      case ProfileType.DIET:
        _lastRemovedChoice = _selectedDiet.removeAt(index);
        (_lastRemovedChoice as DietModel)
            .forbiddenIngredients
            .forEach((e) => _selectedForbiddenProduct.remove(e));
        break;
      case ProfileType.FORBIDDEN_PRODUCT:
        _lastRemovedChoice = _selectedForbiddenProduct.removeAt(index);
        break;
      case ProfileType.UNLIKED_PRODUCT:
        _lastRemovedChoice = _selectedUnlikedProduct.removeAt(index);
        break;
    }
    _lastProfileType = type;
    notifyListeners();
  }

  undoLastRemoved() => addElement(_lastRemovedChoice, _lastProfileType);

  getModel() {
    return new UserModel(
      forbiddenIngredients: _selectedForbiddenProduct,
      compatibleIngredients: _selectedDiet,
      uncompatibleIngredients: _selectedUnlikedProduct,
    );
  }
}

enum ProfileType { DIET, FORBIDDEN_PRODUCT, UNLIKED_PRODUCT }
