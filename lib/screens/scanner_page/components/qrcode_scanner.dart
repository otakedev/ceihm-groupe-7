import 'dart:developer';
import 'dart:io';

import 'package:alergo/core/router.dart';
import 'package:alergo/theme/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScanner extends StatefulWidget {
  const QRCodeScanner({this.onScan, Key key}) : super(key: key);

  final bool Function(Barcode) onScan;

  @override
  _QRCodeScannerState createState() => _QRCodeScannerState();
}

class _QRCodeScannerState extends State<QRCodeScanner> {
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String _lastCode;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 600 ||
            MediaQuery.of(context).size.height < 600)
        ? 300.0
        : 500.0;
    return Stack(
      children: [
        QRView(
          key: qrKey,
          cameraFacing: CameraFacing.back,
          onQRViewCreated: _onQRViewCreated,
          formatsAllowed: [BarcodeFormat.qrcode],
          overlay: QrScannerOverlayShape(
            borderColor: colorAccent,
            borderRadius: 20,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: scanArea,
          ),
        ),
        SafeArea(
          child: IconButton(
            color: colorWhite,
            iconSize: 42,
            icon: Icon(Icons.arrow_back),
            onPressed: () => navigateBackFromPage(context),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      if (this.widget.onScan != null && _lastCode != scanData.code) {
        if (this.widget.onScan(scanData)) {
          controller.dispose();
        }
      }
      _lastCode = scanData.code;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
