import 'package:latlong2/latlong.dart';

abstract class GoongRepository {
  /// Return list of route
  Future<List<LatLng>> getRoutePoints(List<LatLng> locations);
}
