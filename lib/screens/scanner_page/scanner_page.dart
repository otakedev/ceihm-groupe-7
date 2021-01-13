import 'dart:developer';

import 'package:alergo/core/router.dart';
import 'package:alergo/screens/scanner_page/qrcode_scanner.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ScannerPage extends StatelessWidget {
  const ScannerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: QRCodeScanner(
          onScan: (scanData) => {
            log('Barcode Type: ${describeEnum(scanData.format)}   Data: ${scanData.code}'),
            // navigate back for the moment
            navigateBackFromPage(context),
          },
        ),
      ),
    );
  }
}
