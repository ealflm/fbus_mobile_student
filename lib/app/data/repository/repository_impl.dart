import 'package:fbus_mobile_student/app/data/models/route_model.dart';
import 'package:fbus_mobile_student/app/data/models/trip_model.dart';
import 'package:get/get.dart';

import '../../core/base/base_repository.dart';
import '../../network/dio_provider.dart';
import '../models/selected_trip_model.dart';
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
            route.points =
                await goongRepository.getRoutePoints(route.stationLocations);
          }

          return routes;
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Trip>> getTrip(
      String routeId, DateTime date, SelectedTrip selectedTrip) {
    var endPoint = '${DioProvider.baseUrl}/trip';
    var data = {
      'id': routeId,
      'date': date,
    };
    var dioCall = dioTokenClient.get(endPoint, queryParameters: data);

    try {
      return callApi(dioCall).then(((response) {
        List<Trip> trips = [];
        response.data['body'].forEach((value) {
          trips.add(Trip.fromJson(value)..mapSelectedTrip(selectedTrip));
        });
        return trips;
      }));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> bookTrip(
      String studentId, String tripId, String selectedStationId, bool type) {
    var endPoint = '${DioProvider.baseUrl}/student-trip';
    var data = {
      'studentId': studentId,
      'tripId': tripId,
      'stationId': selectedStationId,
      'type': type,
    };

    var dioCall = dioTokenClient.post(endPoint, data: data);

    try {
      return callApi(dioCall);
    } catch (e) {
      rethrow;
    }
  }
}
