import 'package:alergo/core/router.dart';
import 'package:alergo/core/text_style.dart';
import 'package:alergo/models/product_model.dart';
import 'package:alergo/screens/product_page/product_page.dart';
import 'package:alergo/screens/scanner_page/components/qrcode_scanner.dart';
import 'package:alergo/theme/colors.dart';
import 'package:alergo/theme/style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ScannerPage extends StatelessWidget {
  const ScannerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final snackBar = SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      backgroundColor: colorWhite,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Produit non reconnu', style: bodyText2Black(context)),
          Icon(Icons.warning_amber_rounded, color: colorWarn),
        ],
      ),
      behavior: SnackBarBehavior.floating,
    );

    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      body: QRCodeScanner(onScan: (scanData) {
        ProductModel product = ProductModel.fromMock()
            .firstWhere((e) => scanData.code == e.id, orElse: () => null);
        if (product == null) {
          _scaffoldKey.currentState.showSnackBar(snackBar);
          return false;
        } else {
          navigateToRoute(
            context,
            ProductPage.routeName,
            replace: true,
            arguments: product,
          );
          return true;
        }
      }),
    );
  }
}
