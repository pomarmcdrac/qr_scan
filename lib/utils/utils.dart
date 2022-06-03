import 'package:flutter/material.dart';
import 'package:qr_scanner/models/get_scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(BuildContext context,Qr model) async {
  final Uri url = Uri.parse(model.valor);

  if ( model.tipo == 'http' ) {
    if (!await launchUrl(url)) throw 'no se logro lanzar $url';
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: url);
  }
}
launchURLScan(BuildContext context, Uri scanQr, String tipo) async {
  final Uri url = scanQr;

  if ( tipo == 'http' ) {
    if (!await launchUrl(url)) throw 'no se logro lanzar $url';
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scanQr);
  }
}