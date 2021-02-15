import 'package:alergo/models/ingredient_model.dart';
import 'package:alergo/providers/profile_selector_provider.dart';
import 'package:alergo/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductProfileMenu extends StatelessWidget {
  const ProductProfileMenu({
    this.ingredient,
    this.currentValidity = ProfileType.NONE,
    Key key,
  })  : assert(ingredient != null),
        super(key: key);

  final IngredientModel ingredient;
  final ProfileType currentValidity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: PopupMenuButton(
        onSelected: (ProfileType newValidity) => context
            .read<ProfileSelectorProvider>()
            .updateOne(ingredient, currentValidity, newValidity),
        initialValue: currentValidity,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        itemBuilder: (BuildContext context) => <PopupMenuEntry<ProfileType>>[
          const PopupMenuItem(
            value: ProfileType.UNLIKED_PRODUCT,
            child: ListTile(
              leading: Icon(Icons.add_circle),
              title: Text('Je n\'aime pas'),
            ),
          ),
          const PopupMenuItem(
            value: ProfileType.FORBIDDEN_PRODUCT,
            child: ListTile(
              leading: Icon(Icons.add_circle),
              title: Text('Je ne peux pas'),
            ),
          ),
          const PopupMenuDivider(),
          const PopupMenuItem(
            value: ProfileType.LIKE,
            child: ListTile(
              leading: Icon(Icons.check_circle_outline),
              title: Text('Me convient'),
            ),
          ),
        ],
      ),
    );
  }
}
