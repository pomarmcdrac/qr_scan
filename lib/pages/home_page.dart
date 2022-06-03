import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:qr_scanner/pages/pages.dart';
import 'package:qr_scanner/providers/post_provider.dart';
import 'package:qr_scanner/providers/qrs_geo_providers.dart';
import 'package:qr_scanner/providers/qrs_http_provider.dart';
import 'package:qr_scanner/providers/ui_provider.dart';
import 'package:qr_scanner/widgets/widgets.dart';

class HomePage extends StatelessWidget {
   
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Historial'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              borrarScanQR('Pomar');
              // Agregar metodo para borrar


            },
            icon: const Icon( Icons.delete_outline_sharp)
          ),
        ],
      ),
      body:  _HomePageBody(),

      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // Obtener el selected menu opt
    final uiProvider    = Provider.of<UiProvider>(context);
    // Cambiar para mostrar la pag respectiva
    final currentIndex  = uiProvider.selectedMenuOpt;
    // Usar ScanListProvider
    final qrProvider    = Provider.of<QRProvider>(context);
    final qrhProvider   = Provider.of<QRHProvider>(context);


    switch( currentIndex ) {
      case 0:
        qrProvider.getQRPorTipo('Pomar', 'geo');
        return const MapasPage();

      case 1:
        qrhProvider.getQRPorTipo('Pomar', 'http');
        return const DireccionesPage();

      default:
        return const MapasPage();
    }
  }
}


