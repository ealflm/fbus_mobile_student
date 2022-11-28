import 'package:fbus_mobile_student/app/data/models/route_model.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../core/base/base_repository.dart';
import '../../network/dio_provider.dart';
import '../models/station_model.dart';
import 'goong_repository.dart';
import 'repository.dart';

class RepositoryImpl extends BaseRepository implements Repository {
  @override
  Future<String> login(String idToken) async {
    var endpoint = '${DioProvider.baseUrl}/authorization/login';
    var data = {
      'idToken': idToken,
    };
    var dioCall = dioClient.post(endpoint, queryParameters: data);

    try {
      return callApi(dioCall).then((response) => response.data['body']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Route>> getRoute() {
    var endpoint = '${DioProvider.baseUrl}/route';
    var dioCall = dioTokenClient.get(endpoint);

    try {
      return callApi(dioCall).then(
        (response) async {
          List<Route> routes = [];
          if (response.data['body'] != null) {
            response.data['body'].forEach((value) {
              routes.add(Route.fromJson(value));
            });
          }

          // Fetch route points for all route
          GoongRepository goongRepository =
              Get.find(tag: (GoongRepository).toString());
          for (Route route in routes) {
            if (route.stations == null) continue;
            List<LatLng> locations = [];
            for (Station station in route.stations!) {
              if (station.location == null) continue;
              locations.add(station.location!);
            }
            route.points = await goongRepository.getRoutePoints(locations);
          }

          return routes;
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
