import 'package:latlong2/latlong.dart';

class Route {
  String id;
  List<String>? stationIds;
  List<String>? tripIds;
  List<LatLng> points;

  Route({
    required this.id,
    required this.points,
    required this.stationIds,
    required this.tripIds,
  });
}
