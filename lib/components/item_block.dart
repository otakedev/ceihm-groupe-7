import 'dart:ui';

import 'package:alergo/screens/profile_pages/profile_page.dart';
import 'package:alergo/theme/colors.dart';
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
        color: profileSelectorNotifier.isSelected(index, type)
            ? colorValid
            : ThemeData().cardColor,
        clipBehavior: Clip.antiAlias,
        elevation: profileSelectorNotifier.isSelected(index, type) ? 1 : 4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(children: [
          Expanded(
            child: profileSelectorNotifier.isSelected(index, type)
                ? Stack(
                    alignment: AlignmentDirectional.center,
                    fit: StackFit.expand,
                    children: [
                        ColorFiltered(
                          colorFilter:
                              ColorFilter.mode(Colors.black, BlendMode.hue),
                          child: Image.asset(
                            assetPath,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        ClipRRect(
                          child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 0.9, sigmaY: 0.9),
                              child: Container(
                                color: Colors.black.withOpacity(0),
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.check_rounded,
                                  color: colorValid,
                                  size:
                                      MediaQuery.of(context).size.width * 0.25,
                                ),
                              )),
                        )
                      ])
                : Image.asset(
                    assetPath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              itemName,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: profileSelectorNotifier.isSelected(index, type)
                      ? Colors.black
                      : Colors.grey),
            ),
          )
        ]),
      ),
    );
  }
}
