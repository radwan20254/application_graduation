import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

//import 'change_location_button.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});
  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition;
  GoogleMapController? googleMapController;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    initialCameraPosition = const CameraPosition(
      target: LatLng(26.8206, 30.8025), // مركز مصر
      zoom: 6,
    );
    fetchAndShowHospitals();
  }

  @override
  void dispose() {
    googleMapController?.dispose();
    super.dispose();
  }

  Future<void> fetchAndShowHospitals() async {
    try {
      final places = await fetchHospitals();
      final icon =
          BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);

      final newMarkers = places.map((p) {
        final loc = p['geometry']['location'];
        return Marker(
          markerId: MarkerId(p['place_id']),
          position: LatLng(loc['lat'], loc['lng']),
          infoWindow: InfoWindow(title: p['name']),
          icon: icon,
        );
      }).toSet();

      setState(() {
        markers = newMarkers;
      });
    } catch (e) {
      debugPrint('Error fetching hospitals: $e');
    }
  }

  Future<List<Map<String, dynamic>>> fetchHospitals() async {
    final apiKey = dotenv.env['ANDROID_MAP_API_KEY'];
    final url =
        Uri.parse('https://maps.googleapis.com/maps/api/place/textsearch/json'
            '?query=hospital+in+Egypt&key=$apiKey');

    final resp = await http.get(url);
    final data = json.decode(resp.body);
    if (data['status'] == 'OK') {
      return List<Map<String, dynamic>>.from(data['results']);
    } else {
      throw Exception('Places API error: ${data['status']}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: initialCameraPosition,
            markers: markers,
            onMapCreated: (c) {
              googleMapController = c;
              setState(() {});
            },
            myLocationEnabled: true,
          ),
          // if (googleMapController != null)
          //   ChangeLocationButton(googleMapController: googleMapController!),
        ],
      ),
    );
  }
}
