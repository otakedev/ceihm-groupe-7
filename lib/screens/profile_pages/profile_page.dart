import 'package:alergo/screens/profile_pages/choose_diet_page/choose_diet_page.dart';
import 'package:alergo/screens/profile_pages/choose_forbidden_products_page/choose_forbidden_products_page.dart';
import 'package:alergo/screens/profile_pages/choose_unliked_products_page/choose_unliked_products_page.dart';
import 'package:alergo/screens/profile_pages/end_of_profile_form_page/end_of_profile_form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  static final routeName = "/profile";

  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MON PROFIL"),
      ),
      body: ChangeNotifierProvider<ProfileSelectorNotifier>(
          create: (_) => ProfileSelectorNotifier(),
          child: PageView(
            controller: _pageController,
            children: [
              ChooseDietPage(
                goToNextPage: () => goToNextPage(),
              ),
              ChooseForbiddenProductsPage(
                  goToPreviousPage: () => goToPreviousPage(),
                  goToNextPage: () => goToNextPage()),
              ChooseUnlikedProductsPage(
                  goToPreviousPage: () => goToPreviousPage(),
                  goToNextPage: () => goToNextPage()),
              EndOfProfileFormPage(goToPreviousPage: () => goToPreviousPage())
            ],
          )),
    );
  }

  Future<void> goToPreviousPage() {
    return _pageController.previousPage(
        duration: Duration(milliseconds: 400), curve: Curves.fastOutSlowIn);
  }

  Future<void> goToNextPage() {
    return _pageController.nextPage(
        duration: Duration(milliseconds: 400), curve: Curves.fastOutSlowIn);
  }
}

class ProfileSelectorNotifier with ChangeNotifier {
  List<int> selectedDiet = [];
  List<int> selectedForbiddenProduct = [];
  List<int> selectedUnlikedProduct = [];

  List<int> get getSelectedDiet => selectedDiet;
  List<int> get getSelectedForbiddenProduct => selectedForbiddenProduct;
  List<int> get getSelectedUnlikedProduct => selectedUnlikedProduct;

  bool isSelected(int index, ProfileType type) {
    switch (type) {
      case ProfileType.DIET:
        return selectedDiet.contains(index);
      case ProfileType.FORBIDDEN_PRODUCT:
        return selectedForbiddenProduct.contains(index);
      case ProfileType.UNLIKED_PRODUCT:
        return selectedUnlikedProduct.contains(index);
    }
    return false;
  }

  addElement(int index, ProfileType type) {
    switch (type) {
      case ProfileType.DIET:
        selectedDiet.add(index);
        break;
      case ProfileType.FORBIDDEN_PRODUCT:
        selectedForbiddenProduct.add(index);
        break;
      case ProfileType.UNLIKED_PRODUCT:
        selectedUnlikedProduct.add(index);
        break;
    }
    notifyListeners();
  }

  removeElement(int index, ProfileType type) {
    switch (type) {
      case ProfileType.DIET:
        selectedDiet.removeWhere((element) => element == index);
        break;
      case ProfileType.FORBIDDEN_PRODUCT:
        selectedForbiddenProduct.removeWhere((element) => element == index);
        break;
      case ProfileType.UNLIKED_PRODUCT:
        selectedUnlikedProduct.removeWhere((element) => element == index);
        break;
    }
    notifyListeners();
  }
}

enum ProfileType { DIET, FORBIDDEN_PRODUCT, UNLIKED_PRODUCT }
