import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChangeLocationButton extends StatelessWidget {
  const ChangeLocationButton({
    super.key,
    required this.googleMapController,
  });

  final GoogleMapController googleMapController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      right: 16,
      left: 16,
      child: ElevatedButton(
        onPressed: () {
          googleMapController.animateCamera(
              CameraUpdate.newLatLng(const LatLng(31.18, 29.92)));
        },
        child: const Text('Change location'),
      ),
    );
  }
}

// world view 0 -> 3
// country view 4 -> 6
// city view 10 -> 12
// street view 13 -> 17
// building view 18 -> 20