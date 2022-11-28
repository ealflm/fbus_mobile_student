import '../models/route_model.dart';

abstract class Repository {
  /// Google login.
  ///
  /// Return token string.
  Future<String> login(String idToken);

  /// Return list of route
  Future<List<Route>> getRoute();
}
