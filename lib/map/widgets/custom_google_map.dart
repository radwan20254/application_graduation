import 'package:flutter/material.dart';
//import 'package:google_maps_app/models/place_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/place_model.dart';
import 'change_location_button.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition;
  GoogleMapController? googleMapController; // Nullable controller
  String? nightMapStyle;

  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
      target: LatLng(31.187084851056554, 29.928110526889437),
      zoom: 12,
    );
    //initMapStyle();
    initMarkers();
    super.initState();
  }

  @override
  void dispose() {
    googleMapController?.dispose();
    super.dispose();
  }

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            markers: markers,
            //style: nightMapStyle,
            onMapCreated: (contrller) {
              googleMapController = contrller;
              setState(() {});
            },
            initialCameraPosition: initialCameraPosition,
          ),
          if (googleMapController != null)
            ChangeLocationButton(googleMapController: googleMapController!),
        ],
      ),
    );
  }

  // void initMapStyle() async {
  //   nightMapStyle = await DefaultAssetBundle.of(context)
  //       .loadString('assets/map_styles/night_map_style.json');
  //   setState(() {});
  // }

  void initMarkers() async {
    var customMarkerIcon = await BitmapDescriptor.asset(
        const ImageConfiguration(), 'assets/images/icons8-marker-50.png');
    var myMarkers = places
        .map(
          (placeModel) => Marker(
            markerId: MarkerId(placeModel.id.toString()),
            position: placeModel.latLng,
            infoWindow: InfoWindow(title: placeModel.name),
            icon: customMarkerIcon,
            // change the default marker icon color.
            //icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          ),
        )
        .toSet();

    markers.addAll(myMarkers);
    setState(() {});
  }
}
