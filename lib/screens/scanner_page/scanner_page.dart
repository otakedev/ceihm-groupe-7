import 'package:alergo/core/router.dart';
import 'package:alergo/models/product_model.dart';
import 'package:alergo/screens/product_page/product_page.dart';
import 'package:alergo/screens/scanner_page/components/qrcode_scanner.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ScannerPage extends StatelessWidget {
  const ScannerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QRCodeScanner(
        onScan: (scanData) => navigateToRoute(
          context,
          ProductPage.routeName,
          replace: true,
          arguments:
              ProductModel.fromMock().firstWhere((e) => scanData.code == e.id),
        ),
      ),
    );
  }
}
