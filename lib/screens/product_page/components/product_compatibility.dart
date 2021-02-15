import 'package:alergo/core/text_style.dart';
import 'package:alergo/models/ingredient_model.dart';
import 'package:alergo/models/user_model.dart';
import 'package:alergo/theme/colors.dart';
import 'package:alergo/theme/style.dart';
import 'package:flutter/material.dart';

class ProductCompatibility extends StatelessWidget {
  const ProductCompatibility({
    Key key,
    this.title = '',
    this.textstyle,
    this.leading,
    this.color = colorPrimary,
    this.elevation = 0.0,
  }) : super(key: key);

  final String title;
  final Widget leading;
  final Color color;
  final TextStyle textstyle;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      color: colorSecondaryText,
      clipBehavior: Clip.antiAlias,
      elevation: elevation,
      child: Container(
        height: 50,
        color: color,
        child: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Center(
                child: Text(
                  title,
                  style: textstyle ?? headline4White(context),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: leading,
              ),
            )
          ],
        ),
      ),
    );
  }
}

ValidityState verifyIngredientsValidity(
    List<IngredientModel> ingredients, UserModel user) {
  ValidityState validity;
  if (user.isNotSet()) {
    validity = ValidityState(
      Icons.face,
      colorPrimary,
      ProductValidity.normal,
    );
  } else {
    validity = ValidityState(
      Icons.check_circle_sharp,
      colorValid,
      ProductValidity.good,
    );
  }

  ingredients.forEach((element) {
    user.compatibleIngredients.forEach((liked) {
      if (element.id == liked.id) {
        validity = ValidityState(
          Icons.check_circle_sharp,
          colorValid,
          ProductValidity.good,
        );
        return;
      }
    });
  });

  ingredients.forEach((element) {
    user.uncompatibleIngredients.forEach((unliked) {
      if (element.id == unliked.id) {
        validity = ValidityState(
          Icons.warning_rounded,
          colorAccent,
          ProductValidity.warning,
        );
        return;
      }
    });
  });

  ingredients.forEach((element) {
    user.forbiddenIngredients.forEach((forbidden) {
      if (element.id == forbidden.id) {
        validity = ValidityState(
          Icons.block,
          colorWarn,
          ProductValidity.forbidden,
        );
        return;
      }
    });
  });

  return validity;
}

enum ProductValidity { good, warning, forbidden, normal }

class ValidityState {
  final IconData icon;
  final Color color;
  final ProductValidity state;

  ValidityState(this.icon, this.color, this.state);
}
