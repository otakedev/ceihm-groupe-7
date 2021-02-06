import 'package:alergo/models/profile_item_model.dart';
import 'package:alergo/providers/profile_selector_notifier.dart';
import 'package:alergo/screens/profile_pages/components/profile_tile_list.dart';
import 'package:flutter/material.dart';

List<Widget> buildProfileSelection(
    ProfileSelectorNotifier profileSelector, ProfileType type) {
  switch (type) {
    case ProfileType.DIET:
      return getSelectedByType(
        profileSelector.selectedDiet,
        ProfileType.DIET,
      );
    case ProfileType.FORBIDDEN_PRODUCT:
      return getSelectedByType(
        profileSelector.selectedForbiddenProduct,
        ProfileType.FORBIDDEN_PRODUCT,
      );
    case ProfileType.UNLIKED_PRODUCT:
      return getSelectedByType(
        profileSelector.selectedUnlikedProduct,
        ProfileType.UNLIKED_PRODUCT,
      );
    default:
      return const [];
  }
}

List<Widget> getSelectedByType(List<ProfileItemModel> list, ProfileType type) {
  List<Widget> widgets = [];
  for (var i in list)
    widgets.add(
      ProfileTileList(label: i.name, assetPath: i.assetPath),
    );
  return widgets;
}
