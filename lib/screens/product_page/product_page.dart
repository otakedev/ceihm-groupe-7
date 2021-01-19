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
    "1": colorValid,
    "2": colorWarn,
    "3": colorPrimary,
  };

  const ProductPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductModel product = ModalRoute.of(context).settings.arguments;
    final Color color = productValidityTest[product.id] ?? colorPrimary;

    return Scaffold(
      body: ProductDetails(product: product, color: color),
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
