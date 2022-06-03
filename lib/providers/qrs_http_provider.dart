import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:qr_scanner/models/get_scan_model.dart';

class QRHProvider extends ChangeNotifier {
  List<Qr> listQR = [];

  QRHProvider(){
    const String autor = 'Pomar';
    const String tipo = 'http';
    getQRPorTipo(autor, tipo);


  }
  getQRPorTipo(String autor, String tipo) async {
    final response = await http.post(Uri.parse('https://sheloapp.herokuapp.com/sheloapp/api/qrudemy/getQRByAutor'),
    body: {
      'autor':autor,
      'tipo':tipo,
    });
    final qrModelResponse = GetModel.fromJson(response.body);
    listQR = qrModelResponse.qrs;

    notifyListeners();
  }

}