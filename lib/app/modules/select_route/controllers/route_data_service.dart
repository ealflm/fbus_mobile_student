import 'package:fbus_mobile_student/app/core/base/base_controller.dart';
import 'package:get/get.dart';

import '../../../core/widget/shared.dart';
import '../../../data/models/route_model.dart';
import '../../../data/models/station_model.dart';

class RouteDataService extends BaseController {
  @override
  void onInit() {
    fetchRoutes();
    super.onInit();
  }

  // Routes
  final Rx<Map<String, Route>> _routes = Rx<Map<String, Route>>({});
  Map<String, Route> get routes => _routes.value;
  set routes(Map<String, Route> value) {
    _routes.value = value;
  }

  // Selected route
  final _selectedRouteId = ''.obs;
  String get selectedRouteId => _selectedRouteId.value;
  set selectedRouteId(String value) {
    _selectedRouteId.value = value;
  }

  Route? get selectedRoute {
    return routes[_selectedRouteId.value];
  }

  // Stations
  final Rx<Map<String, Station>> _stations = Rx<Map<String, Station>>({});
  Map<String, Station> get stations => _stations.value;
  set stations(Map<String, Station> value) {
    _stations.value = value;
  }

  // Selected station
  final _selectedStationId = ''.obs;
  String get selectedStationId => _selectedStationId.value;
  set selectedStationId(String value) {
    _selectedStationId.value = value;
  }

  Station? get selectedStation {
    return stations[_selectedStationId.value];
  }

  Future<void> fetchRoutes() async {
    var routesService = repository.getRoute();

    await callDataService(
      routesService,
      onSuccess: (List<Route> response) {
        routes = routeListToRouteMap(response);
        stations = routeListToStationMap(response);
      },
      onError: ((exception) {
        showToast('Không thể kết nối');
      }),
    );
  }

  Map<String, Route> routeListToRouteMap(List<Route> value) {
    Map<String, Route> result = {};
    for (Route route in value) {
      if (route.id != null) {
        result[route.id!] = route;
      }
    }
    return result;
  }

  Map<String, Station> routeListToStationMap(List<Route> value) {
    Map<String, Station> result = {};
    for (Route route in value) {
      if (route.id != null && route.stations != null) {
        for (Station station in route.stations!) {
          if (station.id != null) {
            result[station.id!] = station;
          }
        }
      }
    }
    return result;
  }
}
