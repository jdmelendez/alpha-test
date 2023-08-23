import 'dart:io';

import 'package:alpha_test/presentation/shared/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../domain/theme/theme.dart';

class ScanerScreen extends StatefulWidget {
  const ScanerScreen({Key? key}) : super(key: key);

  @override
  State<ScanerScreen> createState() => _ScanerScreenState();
}

class _ScanerScreenState extends State<ScanerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;

    return Scaffold(
      appBar: AppBar(
          // title: Text('ScanerScreen'),
          ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          gapH64,
          Center(
            child: Container(
              height: 250,
              width: 250,
              child: Flexible(
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
            ),
          ),
          gapH32,
          Text("CÓDIGO: ${result?.code ?? 'XXXXXX'}"),
          Spacer(),
          Container(
            decoration: BoxDecoration(color: AppTheme.red),
            width: double.infinity,
            height: 60,
            child: Center(
                child: Text(
              "ADELANTE",
              style: TextStyle(fontSize: 26, color: AppTheme.white),
            )),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
