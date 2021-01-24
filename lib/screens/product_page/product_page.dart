import 'package:alergo/core/router.dart';
import 'package:alergo/models/product_model.dart';
import 'package:alergo/screens/product_page/components/product_details.dart';
import 'package:alergo/screens/scanner_page/scanner_page.dart';
import 'package:alergo/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductPage extends StatelessWidget {
  static const routeName = '/product';

  static const productValidityTest = {
    "1": {
      "color": colorValid,
      "text": "Compatible",
      "icon": Icons.check_circle_sharp
    },
    "2": {
      "color": colorWarn,
      "text": "Incompatible",
      "icon": Icons.highlight_off_rounded
    },
    "3": {
      "color": colorAccent,
      "text": "Attention",
      "icon": Icons.warning_rounded
    },
  };

  const ProductPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // POUR LES PHASES DE DEV , NE PAS SUPPRIMER
    // final ProductModel product =
    //     ProductModel.fromMock().firstWhere((e) => "1" == e.id);
    final ProductModel product = ModalRoute.of(context).settings.arguments;
    final Color color =
        productValidityTest[product.id]["color"] ?? colorPrimary;
    final IconData icon = productValidityTest[product.id]["icon"];
    final String text = productValidityTest[product.id]["text"];

    return Scaffold(
      body: ProductDetails(
          product: product, color: color, icon: icon, compatibilityTitle: text),
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
}
