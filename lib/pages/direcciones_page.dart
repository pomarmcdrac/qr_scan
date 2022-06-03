import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/qrs_http_provider.dart';
import 'package:qr_scanner/widgets/widgets.dart';

class DireccionesPage extends StatelessWidget {
  const DireccionesPage({Key? key}) : super(key: key);

   
  @override
  Widget build(BuildContext context) {
    final qrProvider = Provider.of<QRHProvider>(context);
    final listQR = qrProvider.listQR;

    return ListViewBuilder(listQR: listQR, icon: Icon( Icons.link_sharp , color: Theme.of(context).primaryColor,));
  }
}