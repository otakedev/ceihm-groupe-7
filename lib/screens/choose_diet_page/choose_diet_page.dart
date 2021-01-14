import 'package:alergo/components/item_block.dart';
import 'package:alergo/mocks/diet_items_mock.dart';
import 'package:alergo/models/diet_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChooseDietPage extends StatefulWidget {
  const ChooseDietPage({Key key}) : super(key: key);

  @override
  _ChooseDietPageState createState() => _ChooseDietPageState();
}

class _ChooseDietPageState extends State<ChooseDietPage> {
  List<int> selectedIndexes = [];
  List<DietItemModel> diets =
      DIET_ITEMS_MOCK.map((e) => new DietItemModel.fromMap(e)).toList();

  @override
  Widget build(BuildContext context) {
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
                  isSelected: selectedIndexes.contains(index),
                  onSelect: () {
                    setState(() {
                      selectedIndexes.add(index);
                    });
                  },
                  onDeselect: () {
                    setState(() {
                      if (selectedIndexes.contains(index)) {
                        selectedIndexes
                            .removeWhere((element) => element == index);
                      }
                    });
                  },
                );
              }),
        ),
      ),
    );
  }
}
