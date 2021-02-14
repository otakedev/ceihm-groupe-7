import 'dart:ui';

import 'package:alergo/models/profile_item_model.dart';
import 'package:alergo/providers/profile_selector_provider.dart';
import 'package:alergo/theme/colors.dart';
import 'package:alergo/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ProfileItemBlock extends StatelessWidget {
  const ProfileItemBlock({
    Key key,
    @required this.item,
    @required this.type,
  })  : assert(item != null),
        super(key: key);

  final ProfileItemModel item;
  final ProfileType type;

  @override
  Widget build(BuildContext context) {
    final ProfileSelectorProvider profileSelectorNotifier =
        Provider.of<ProfileSelectorProvider>(context);

    final isSelected = profileSelectorNotifier.isSelected(item, type);

    return InkWell(
      onTap: isSelected
          ? () => profileSelectorNotifier.removeElement(item, type)
          : () => profileSelectorNotifier.addElement(item, type),
      child: Card(
        color: isSelected ? colorValid : ThemeData().cardColor,
        clipBehavior: Clip.antiAlias,
        elevation: isSelected ? 0 : 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: isSelected
                    ? Stack(
                        alignment: AlignmentDirectional.center,
                        fit: StackFit.expand,
                        children: [
                          ColorFiltered(
                            colorFilter:
                                ColorFilter.mode(Colors.black, BlendMode.hue),
                            child: Image.asset(
                              item.assetPath,
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
                              ),
                            ),
                          )
                        ],
                      )
                    : Image.asset(
                        item.assetPath,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: isSelected ? Colors.black : Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
