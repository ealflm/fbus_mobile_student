import 'package:latlong2/latlong.dart';

class Station {
  String id;
  String title;
  String address;
  LatLng location;

  Station({
    required this.id,
    required this.title,
    required this.address,
    required this.location,
  });
}
