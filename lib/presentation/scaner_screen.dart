import 'dart:io';

import 'package:alpha_test/data/repositories/lecturas_repository.dart';
import 'package:alpha_test/data/repositories/tickets_repository.dart';
import 'package:alpha_test/presentation/shared/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../data/models/lectura.dart';
import '../data/models/ticket.dart';
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
      if (result != null && codeScaned != result!.code) {
        codeScaned = result!.code ?? "";

        // Se obtiene el ticket de la base de datos local
        TicketsRepository ticketsRepository = TicketsRepository();
        LecturasRepository lecturasRepository = LecturasRepository();
        Ticket? ticket =
            await ticketsRepository.get_ByCode_LocalDB(result!.code ?? "");
        if (ticket != null) {
          // Si el ticket tiene el estado a 0, se registra la entrada
          isOk = ticket.state == 0 ? 1 : 0;

          // Si el ticket tiene el estado a 0, se registra la entrada
          ticketsRepository.update_LocalDB(ticket.copyWith(state: 1));
        }

        lecturasRepository.insert_LocalDB(Lectura(
            code: codeScaned, fecha: DateTime.now(), isOk: isOk, id: 1));

        setState(() {});
      }
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
          Flexible(
            child: Center(
              child: Container(
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
          Spacer(),
          checkQR(
            isOk: isOk == 1,
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
  const checkQR({
    super.key,
    required this.isOk,
  });

  final bool isOk;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: isOk ? AppTheme.green : AppTheme.red),
      width: double.infinity,
      height: 60,
      child: Center(
          child: Text(
        isOk ? "ADELANTE" : "ERROR",
        style: TextStyle(fontSize: 26, color: AppTheme.white),
      )),
    ).animate().fade();
  }
}
