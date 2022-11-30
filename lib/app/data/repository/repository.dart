import '../models/route_model.dart';
import '../models/selected_trip_model.dart';
import '../models/trip_model.dart';

abstract class Repository {
  /// Google login.
  ///
  /// Return token string.
  Future<String> login(String idToken);

  /// Return list of route
  Future<List<Route>> getRoute();

  /// Get trip with routeId and datetime
  Future<List<Trip>> getTrip(
      String routeId, DateTime dateTime, SelectedTrip selectedTrip);
}
