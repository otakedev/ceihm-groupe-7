import 'package:alergo/components/bottom_drawer.dart';
import 'package:alergo/components/dismissible_list_view.dart';
import 'package:alergo/core/utils.dart';
import 'package:alergo/models/diet_model.dart';
import 'package:alergo/models/ingredient_model.dart';
import 'package:alergo/providers/profile_selector_provider.dart';
import 'package:alergo/screens/profile_pages/components/build_widgets_selection.dart';
import 'package:alergo/screens/profile_pages/components/profile_final_tab_page.dart';
import 'package:alergo/screens/profile_pages/components/profile_tab_page.dart';
import 'package:alergo/theme/colors.dart';
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

  double _currentStepWidth = 0.0;

  final _profileLabels = [
    'Choix du régime',
    'Je ne peux pas',
    'Je n\'aime pas',
    'Suivant'
  ];

  final _profileType = [
    ProfileType.DIET,
    ProfileType.FORBIDDEN_PRODUCT,
    ProfileType.UNLIKED_PRODUCT,
    null
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("MON PROFIL"),
      ),
      body: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            color: colorPrimary,
            width: _currentStepWidth,
            height: 5,
          ),
          PageView(
            onPageChanged: (i) => setState(() => {
                  _currentPage = i,
                  _currentStepWidth =
                      screenWidth * remapInterval(_currentPage, 0, 3, 0, 1),
                }),
            controller: _pageController,
            children: [
              ProfileTabPage(
                items: DietModel.fromMock(),
                label: _profileLabels[0],
                profileType: ProfileType.DIET,
              ),
              ProfileTabPage(
                items: IngredientModel.fromMock(),
                label: _profileLabels[1],
                profileType: ProfileType.FORBIDDEN_PRODUCT,
              ),
              ProfileTabPage(
                items: IngredientModel.fromMock(),
                label: _profileLabels[2],
                profileType: ProfileType.UNLIKED_PRODUCT,
              ),
              ProfileFinalTabPage(
                text:
                    "Votre profil est complet. Vous pourrez le modifier à tout moment (Icone Profil).",
              )
            ],
          ),
          Consumer<ProfileSelectorProvider>(
            builder: (context, profileSelector, child) => BottomDrawer(
              actionPadding:
                  EdgeInsets.only(bottom: 32, top: 8, left: 8, right: 8),
              hint:
                  'Un régime présélectionne les ingrédients que vous ne pouvez pas consommer.',
              drawerClosedText: "Mes Choix",
              drawerOpenedText: "Fermer",
              actionPosition: ActionPosition.bottom,
              rightAction: _currentPage < _profileLabels.length - 1
                  ? MenuAction(onAction: () => goToNextPage(), text: "Suivant")
                  : null,
              leftAction: _currentPage >= 1
                  ? MenuAction(
                      color: colorWhite,
                      text: 'Précédent',
                      onAction: () => goToPreviousPage(),
                    )
                  : null,
              menuWidgets: _profileType[_currentPage] != null
                  ? DismissibleListView(
                      onWidgetRemoved: (index) =>
                          profileSelector.removeElementById(
                        index,
                        _profileType[_currentPage],
                      ),
                      onWidgetUndo: (index) =>
                          profileSelector.undoLastRemoved(),
                      widgets: buildProfileSelection(
                        profileSelector,
                        _profileType[_currentPage],
                      ),
                    )
                  : null,
            ),
          ),
        ],
      ),
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
