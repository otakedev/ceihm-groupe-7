import 'dart:developer';

import 'package:alergo/components/bottom_drawer.dart';
import 'package:alergo/components/dismissible_list_view.dart';
import 'package:alergo/core/router.dart';
import 'package:alergo/core/text_style.dart';
import 'package:alergo/models/diet_model.dart';
import 'package:alergo/models/ingredient_model.dart';
import 'package:alergo/providers/profile_selector_provider.dart';
import 'package:alergo/screens/profile_pages/components/build_widgets_selection.dart';
import 'package:alergo/screens/profile_pages/components/profile_tab_page.dart';
import 'package:alergo/theme/colors.dart';
import 'package:alergo/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateProfilePage extends StatefulWidget {
  static final routeName = "/profile/update";

  const UpdateProfilePage({Key key}) : super(key: key);

  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  @override
  Widget build(BuildContext context) {
    final _profileType = [
      ProfileType.DIET,
      ProfileType.FORBIDDEN_PRODUCT,
      ProfileType.UNLIKED_PRODUCT,
      null
    ];

    int _currentIndex = 0;

    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              navigateBackFromPage(context, 'Profil sauvegardé');
            },
          ),
          bottom: TabBar(
            tabs: [
              const Text('Mes régimes'),
              const Text('Je ne peux pas'),
              const Text('Je n\'aime pas'),
            ],
          ),
          title: const Text('MODIFIER MON PROFIL'),
        ),
        body: Stack(
          children: [
            TabBarView(
              children: [
                ProfileTabPage(
                  items: DietModel.fromMock(),
                  profileType: ProfileType.DIET,
                ),
                ProfileTabPage(
                  items: IngredientModel.fromMock(),
                  profileType: ProfileType.FORBIDDEN_PRODUCT,
                ),
                ProfileTabPage(
                  items: IngredientModel.fromMock(),
                  profileType: ProfileType.UNLIKED_PRODUCT,
                ),
              ],
            ),
            Builder(
              builder: (BuildContext context) => BuildBottomDrawer(
                profileType: _profileType,
                currentIndex: _currentIndex,
                tabController: DefaultTabController.of(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// BottomDrawer wrap in a stateful widget to rerender when
/// the tab index changed
class BuildBottomDrawer extends StatefulWidget {
  const BuildBottomDrawer({
    Key key,
    @required List<ProfileType> profileType,
    @required int currentIndex,
    @required TabController tabController,
  })  : _profileType = profileType,
        _tabController = tabController,
        super(key: key);

  final List<ProfileType> _profileType;
  final TabController _tabController;

  @override
  _BuildBottomDrawerState createState() => _BuildBottomDrawerState();
}

class _BuildBottomDrawerState extends State<BuildBottomDrawer> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = this.widget._tabController.index;
    this.widget._tabController.addListener(() {
      if (!this.widget._tabController.indexIsChanging) {
        setState(() {
          _currentIndex = this.widget._tabController.index;
        });
      }
    });

    return Consumer<ProfileSelectorProvider>(
      builder: (context, profileSelector, child) => BottomDrawer(
        drawerClosedText: "Mes Choix",
        drawerOpenedText: "Fermer",
        actionPosition: ActionPosition.top,
        menuWidgets: widget._profileType[_currentIndex] != null
            ? DismissibleListView(
                onWidgetRemoved: (index) => profileSelector.removeElementById(
                  index,
                  widget._profileType[_currentIndex],
                ),
                onWidgetUndo: (index) => profileSelector.undoLastRemoved(),
                widgets: buildProfileSelection(
                  profileSelector,
                  widget._profileType[_currentIndex],
                ),
              )
            : null,
      ),
    );
  }
}
