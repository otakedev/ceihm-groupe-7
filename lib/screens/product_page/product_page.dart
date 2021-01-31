import 'dart:developer';

import 'package:alergo/core/router.dart';
import 'package:alergo/models/ingredient_model.dart';
import 'package:alergo/models/product_model.dart';
import 'package:alergo/models/user_model.dart';
import 'package:alergo/providers/profile_selector_notifier.dart';
import 'package:alergo/screens/product_page/components/product_details.dart';
import 'package:alergo/screens/scanner_page/scanner_page.dart';
import 'package:alergo/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  static const routeName = '/product';

  static const productValidity = {
    "good": {
      "color": colorValid,
      "text": "Compatible",
      "icon": Icons.check_circle_sharp
    },
    "forbidden": {
      "color": colorWarn,
      "text": "Incompatible",
      "icon": Icons.highlight_off_rounded
    },
    "warning": {
      "color": colorAccent,
      "text": "Attention",
      "icon": Icons.warning_rounded
    },
    "normal": {"color": colorPrimary, "text": "Normal", "icon": Icons.face},
  };

  const ProductPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // POUR LES PHASES DE DEV , NE PAS SUPPRIMER
    // final ProductModel product =
    //     ProductModel.fromMock().firstWhere((e) => "1" == e.id);
    final ProductModel product = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Consumer<ProfileSelectorNotifier>(
        builder: (context, profileSelector, child) {
          final UserModel user = profileSelector.getModel();
          final Color color =
              productValidity[computeCompatibility(product.ingredients, user)]
                      ["color"] ??
                  colorPrimary;
          final IconData icon =
              productValidity[computeCompatibility(product.ingredients, user)]
                  ["icon"];
          final String text =
              productValidity[computeCompatibility(product.ingredients, user)]
                  ["text"];
          return ProductDetails(
              product: product,
              color: color,
              icon: icon,
              compatibilityTitle: text,
              user: user,
              dictionary: productValidity,
              computeFunction: computeCompatibility);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: SvgPicture.asset(
          'assets/qrcodescan.svg',
          color: colorWhite,
          fit: BoxFit.contain,
        ),
        onPressed: () => navigateToPage(context, ScannerPage(), replace: true),
      ),
    );
  }

  String computeCompatibility(
      List<IngredientModel> ingredients, UserModel user) {
    String result = "normal";

    ingredients.forEach((element) {
      user.likedIngredients.forEach((liked) {
        if (element.id == liked.id) {
          result = "good";
          return;
        }
      });
    });

    ingredients.forEach((element) {
      user.unlikedIngredients.forEach((unliked) {
        if (element.id == unliked.id) {
          result = "warning";
          return;
        }
      });
    });

    ingredients.forEach((element) {
      user.forbiddenIngredients.forEach((forbidden) {
        if (element.id == forbidden.id) {
          result = "forbidden";
          return;
        }
      });
    });

    return result;
  }
}
