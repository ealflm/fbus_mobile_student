import 'package:latlong2/latlong.dart';

class Route {
  String id;
  String title;
  List<String>? stationIds;
  List<String>? tripIds;
  List<LatLng> points;

  Route({
    required this.id,
    required this.title,
    required this.points,
    required this.stationIds,
    required this.tripIds,
  });
}
