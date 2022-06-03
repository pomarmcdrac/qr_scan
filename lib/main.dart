import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:qr_scanner/pages/pages.dart';
import 'package:qr_scanner/providers/qrs_geo_providers.dart';
import 'package:qr_scanner/providers/qrs_http_provider.dart';
import 'package:qr_scanner/providers/ui_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => UiProvider()), 
        ChangeNotifierProvider(create: ( _ ) => QRProvider()), 
        ChangeNotifierProvider(create: ( _ ) => QRHProvider()), 
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home'  :( _ ) => const HomePage(),
          'mapa'  :( _ ) => const MapaPage(),
    
        },
        theme: ThemeData(
          primarySwatch: Colors.amber,
          )
      ),
    );
  }
}