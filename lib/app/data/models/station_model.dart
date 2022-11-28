import 'package:latlong2/latlong.dart';

class Station {
  String? id;
  String? name;
  String? address;
  LatLng? location;
  int? status;

  Station({
    this.id,
    this.name,
    this.address,
    this.location,
    this.status,
  });

  Station.fromJson(Map<String, dynamic> json) {
    id = json['stationId'];
    name = json['name'];
    address = json['address'];
    double lat = json['latitude'];
    double lng = json['longitude'];
    location = LatLng(lat, lng);
    status = json['status'];
  }
}
