import 'package:alergo/models/profile_item_block_model.dart';
import 'package:flutter/material.dart';

class ProfileSelectorNotifier with ChangeNotifier {
  List<ProfileItemBlockModel> _selectedDiet = [];
  List<ProfileItemBlockModel> _selectedForbiddenProduct = [];
  List<ProfileItemBlockModel> _selectedUnlikedProduct = [];

  ProfileItemBlockModel _lastRemovedChoice;
  ProfileType _lastProfileType;

  List<ProfileItemBlockModel> get selectedDiet => _selectedDiet;
  List<ProfileItemBlockModel> get selectedForbiddenProduct =>
      _selectedForbiddenProduct;
  List<ProfileItemBlockModel> get selectedUnlikedProduct =>
      _selectedUnlikedProduct;

  bool isSelected(ProfileItemBlockModel model, ProfileType type) {
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

  addElement(ProfileItemBlockModel model, ProfileType type) {
    switch (type) {
      case ProfileType.DIET:
        _selectedDiet.add(model);
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

  removeElement(ProfileItemBlockModel model, ProfileType type) {
    switch (type) {
      case ProfileType.DIET:
        _selectedDiet.removeWhere((element) => element == model);
        break;
      case ProfileType.FORBIDDEN_PRODUCT:
        _selectedForbiddenProduct.removeWhere((element) => element == model);
        break;
      case ProfileType.UNLIKED_PRODUCT:
        _selectedUnlikedProduct.removeWhere((element) => element == model);
        break;
    }
    notifyListeners();
  }

  removeElementById(int index, ProfileType type) {
    switch (type) {
      case ProfileType.DIET:
        _lastRemovedChoice = _selectedDiet.removeAt(index);
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

  undoLastRemoved() {
    switch (_lastProfileType) {
      case ProfileType.DIET:
        _selectedDiet.add(_lastRemovedChoice);
        break;
      case ProfileType.FORBIDDEN_PRODUCT:
        _selectedForbiddenProduct.add(_lastRemovedChoice);
        break;
      case ProfileType.UNLIKED_PRODUCT:
        _selectedUnlikedProduct.add(_lastRemovedChoice);
        break;
    }
    notifyListeners();
  }
}

enum ProfileType { DIET, FORBIDDEN_PRODUCT, UNLIKED_PRODUCT }
