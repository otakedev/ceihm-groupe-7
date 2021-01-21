// Flutter
import 'dart:developer';
import 'package:alergo/components/bottom_drawer.dart';
import 'package:alergo/components/dismissible_list_view.dart';
import 'package:alergo/models/profile_form_model.dart';
import 'package:alergo/screens/profile_pages/components/profile_tile_list.dart';
import 'package:alergo/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Internal
import 'package:alergo/core/router.dart';

// Pages
import 'package:alergo/screens/profile_pages/choose_forbidden_products_page/choose_forbidden_products_page.dart';

class ChooseDietPage extends StatelessWidget {
  const ChooseDietPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => log("cancel pressed"),
          icon: Icon(Icons.cancel),
        ),
        title: Text("Choix du régime"),
      ),
      body: Stack(
        children: [
          Container(child: Text('the list goes here')),
          BottomDrawer(
            actionPosition: ActionPosition.top,
            rightAction: _buildNextButton(context),
            menuWidgets: DismissibleListView(
              onWidgetRemoved: (index) => log('$index removed'),
              onWidgetUndo: (index) => log('$index undo'),
              widgets: [
                for (var i in ProfileFormModel.fromMock())
                  ProfileTileList(label: i.label, imageUrl: i.imageUrl)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return RaisedButton(
      // The diet page does not have a "Précédent" button
      onPressed: () => navigateToPage(context, ChooseForbiddenProductsPage()),
      child: Text("Suivant"),
    );
  }
}
