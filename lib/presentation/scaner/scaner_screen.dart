// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:alpha_test/presentation/shared/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../domain/theme/theme.dart';
import 'bloc/scaner_bloc.dart';

class ScanerScreen extends StatefulWidget {
  const ScanerScreen({Key? key}) : super(key: key);

  @override
  State<ScanerScreen> createState() => _ScanerScreenState();
}

class _ScanerScreenState extends State<ScanerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  String codeScaned = "";
  int isOk = 0;

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

  void _onQRViewCreated(QRViewController controller) async {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      result = scanData;

      // Si el codigo escaneado no es nula y es distinto al anterior
      if (result != null && codeScaned != result!.code) {
        codeScaned = result!.code ?? "";

        // Se lee el ticket
        context.read<ScanerBloc>().add(ScanerRead(code: codeScaned));

        setState(() {});
      }
    });
  }

  @override
  void initState() {
    context.read<ScanerBloc>().add(const ScanerReset());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('ScanerScreen'),
          ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          gapH64,
          Flexible(
            child: Center(
              child: SizedBox(
                height: 250,
                width: 250,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
            ),
          ),
          gapH32,
          codeQR(result: result),
          const Spacer(),
          checkQR()
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

class codeQR extends StatelessWidget {
  const codeQR({
    super.key,
    required this.result,
  });

  final Barcode? result;

  @override
  Widget build(BuildContext context) {
    return Text("CÓDIGO: ${result?.code ?? 'XXXXXX'}");
  }
}

class checkQR extends StatelessWidget {
  checkQR({
    super.key,
  });

  bool isOk = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScanerBloc, ScanerState>(
      builder: (context, state) {
        isOk = state.status == ScanerStatus.isOk;

        return Container(
          decoration:
              BoxDecoration(color: isOk ? AppTheme.green : AppTheme.red),
          width: double.infinity,
          height: 60,
          child: Center(
              child: Text(
            isOk ? "ADELANTE" : "ERROR",
            style: const TextStyle(fontSize: 26, color: AppTheme.white),
          )),
        ).animate().fade();
      },
    );
  }
}
