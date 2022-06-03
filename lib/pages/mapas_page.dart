import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/qrs_geo_providers.dart';

import '../widgets/listview_builder.dart';

class MapasPage extends StatelessWidget {

  const MapasPage({Key? key}) : super(key: key);
   
  @override
  Widget build(BuildContext context) {

    final qrProvider = Provider.of<QRProvider>(context);
    final listQR = qrProvider.listQR;

    return ListViewBuilder(listQR: listQR, icon:Icon( Icons.location_on_sharp , color: Theme.of(context).primaryColor,),);
  }
}

