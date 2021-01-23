import 'package:alergo/screens/profile_pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ItemBlock extends StatelessWidget {
  final String itemName;
  final String assetPath;
  final int index;
  final ProfileType type;

  const ItemBlock(
      {Key key,
      @required this.itemName,
      @required this.assetPath,
      @required this.index,
      @required this.type})
      : assert(index != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileSelectorNotifier profileSelectorNotifier =
        Provider.of<ProfileSelectorNotifier>(context);

    return InkWell(
      onTap: profileSelectorNotifier.isSelected(index, type)
          ? () => profileSelectorNotifier.removeElement(index, type)
          : () => profileSelectorNotifier.addElement(index, type),
      child: Card(
          child: Padding(
            padding: EdgeInsets.only(top: 8),
            child: Column(children: [
              Expanded(
                child: Image.asset(
                  assetPath,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(itemName),
              )
            ]),
          ),
          color: profileSelectorNotifier.isSelected(index, type)
              ? ThemeData().accentColor
              : ThemeData().cardColor),
    );
  }
}
