import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Expanded(
          child: FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(48.8588443, 2.2943506), // Position de Paris
              initialZoom: 4.6,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
