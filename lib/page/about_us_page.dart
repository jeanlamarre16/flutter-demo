import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AboutUsPage extends StatelessWidget {
  AboutUsPage({super.key});
  final mapController = MapController();

  double latitude = 47.2060287;
  double longitude= -1.5393726;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     floatingActionButton: FloatingActionButton(
        onPressed: ()=> mapController.move(LatLng(47.47, -0.13), 21),
       child: Icon(Icons.gps_fixed),
      ),
      body:FlutterMap(
          options: MapOptions(initialCenter: LatLng(latitude, longitude)),
          mapController: mapController,
          children: [
            TileLayer(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
            ),
            MarkerLayer(
                markers: [
                  Marker(
                      child: Icon(Icons.school),
                      point: LatLng(latitude, longitude)
                  )
                ]
            )
          ],
      ),
    );
  }
}
