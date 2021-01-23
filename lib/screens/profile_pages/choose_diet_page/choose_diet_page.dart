import 'package:alergo/components/item_block.dart';
import 'package:alergo/mocks/profil_items_mock.dart';
import 'package:alergo/models/profile_item_block_model.dart';
import 'package:alergo/screens/profile_pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChooseDietPage extends StatelessWidget {
  final VoidCallback goToNextPage;
  const ChooseDietPage({Key key, @required this.goToNextPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProfileItemBlockModel> diets = FORBIDDEN_ITEMS_MOCK
        .map((e) => new ProfileItemBlockModel.fromMap(e))
        .toList();
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.09),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: MediaQuery.of(context).size.width * 0.09,
                mainAxisSpacing: MediaQuery.of(context).size.height * 0.04,
              ),
              shrinkWrap: true,
              itemCount: diets.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemBlock(
                  itemName: diets[index].itemName,
                  assetPath: diets[index].assetPath,
                  index: index,
                  type: ProfileType.DIET,
                );
              }),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Spacer(),
            RaisedButton(
              // The diet page does not have a "Précédent" button
              onPressed: () => goToNextPage(),
              child: Text("Suivant"),
            ),
          ],
        ),
      ),
    );
  }
}
