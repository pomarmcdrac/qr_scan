import 'package:http/http.dart' as http;

class PostData {
  static getScanQR(String barcodeScanRes) {}
  static borrarScanQR(String autor) {}
  static borrarScanQRByValor(String autor, String valor) {}

}
Future<String> getScanQR( String barcodeScanRes) async {
  String tipo;
  String res = '';
  if (barcodeScanRes.contains('http')) {
      tipo = 'http';
    } else {
      tipo = 'geo';
    }

  final response = await http.post(
    Uri.parse('https://sheloapp.herokuapp.com/sheloapp/api/qrudemy/addQR'),
    body: {
      "tipo":tipo,
      "valor":barcodeScanRes,
      "autor":"Pomar"
    }
  );
  res = response.body;
  return res;
}

borrarScanQR(String autor) {
  final response = http.post(
    Uri.parse('https://sheloapp.herokuapp.com/sheloapp/api/qrudemy/deleteAllQrByAutor'),
    body: {
      "autor":autor
    }
  );
  return response;
}

borrarScanQRByValor(String autor, String valor) {
  final response = http.post(
    Uri.parse('https://sheloapp.herokuapp.com/sheloapp/api/qrudemy/deleteQrByAutorAndValor'),
    body: {
      "autor":autor,
      "valor":valor
    },
  );
  return response;
}

