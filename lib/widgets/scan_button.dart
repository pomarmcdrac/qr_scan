import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_scanner/providers/post_provider.dart';
import 'package:qr_scanner/utils/utils.dart';


class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return FloatingActionButton(
      elevation: 0,
      child: const Icon( Icons.filter_center_focus_sharp),
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode( '#3D8BEF', 'Cancelar', false, ScanMode.QR);
        if (barcodeScanRes != '-1') {
          String mensaje = await getScanQR(barcodeScanRes); 
          String tipo;

          if (barcodeScanRes.contains('http')) {
            tipo = 'http';
          } else {
            tipo = 'geo';
          }
          // ignore: use_build_context_synchronously
          launchURLScan(context, Uri.parse(barcodeScanRes), tipo);

          if (mensaje.contains('correctamente')) {
            // ignore: avoid_print,
            print('Scaneo Correcto');
          } else {
            // ignore: avoid_print
            print('Scaneo Erroneo');
          }

        }
      },
    );
  }
}


