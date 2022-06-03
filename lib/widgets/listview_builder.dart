import 'package:flutter/material.dart';

import 'package:qr_scanner/models/get_scan_model.dart';
import 'package:qr_scanner/providers/post_provider.dart';
import 'package:qr_scanner/utils/utils.dart';

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({
    Key? key,
    required this.listQR,
    required this.icon
  }) : super(key: key);

  final List<Qr> listQR;
  final Icon icon;


  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: listQR.length, 
      itemBuilder: ( _ , i) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (DismissDirection direction) {
          borrarScanQRByValor(listQR[i].autor, listQR[i].valor);
        },
        child: ListTile(
          leading: icon,
          title: Text( listQR[i].valor),
          subtitle: Text( listQR[i].id),
          trailing: const Icon( Icons.arrow_circle_right_sharp, color: Colors.amber,),
          onTap: () => launchURL(context, listQR[i]),
        ),
      )
    );
  }




}