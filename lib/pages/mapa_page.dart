import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapaPage extends StatefulWidget {
   
  const MapaPage({Key? key}) : super(key: key);

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {

  final Completer<GoogleMapController> _controller = Completer();
  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    
    final String url = ModalRoute.of(context)!.settings.arguments.toString();

    final latLng  = url.substring(4).split(',');
    final lat     = double.parse( latLng[0] );
    final lng     = double.parse( latLng[1] );

    final CameraPosition puntoInicial = CameraPosition(
      target: LatLng(lat, lng),
      zoom: 17,
      tilt: 50,

    );

    // Marcadores
    Set<Marker> markers = <Marker>{};
    markers.add(Marker(
      markerId: const MarkerId('geo-location'),
      position: LatLng(lat, lng),
    ));


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Mapa'),
        actions: [
          IconButton(
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(CameraUpdate.newCameraPosition(puntoInicial));
            },
             icon: const Icon(Icons.my_location_outlined)
          )
        ],
      ),
      body: GoogleMap(
        compassEnabled: false,
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        markers: markers,
        mapType: mapType,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.library_add_check_sharp),
        onPressed: () {
          if ( mapType == MapType.normal ) {
            mapType = MapType.satellite;
          } else {
            mapType = MapType.normal;
          }
          setState(() {});
        }
        ),
    );
  }
}