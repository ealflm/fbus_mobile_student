import 'package:fbus_mobile_student/app/core/base/base_controller.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../core/widget/shared.dart';
import 'route_model.dart';
import 'station_model.dart';
import 'trip_model.dart';

class SelectedTrip extends BaseController {
  // Selected route
  final Rx<Route?> _selectedRoute = Rx<Route?>(null);
  Route? get selectedRoute => _selectedRoute.value;
  set selectedRoute(Route? value) {
    _selectedRoute.value = value;
  }

  // Selected trip
  final Rx<Trip?> _selectedTrip = Rx<Trip?>(null);
  Trip? get selectedTrip => _selectedTrip.value;
  set selectedTrip(Trip? value) {
    _selectedTrip.value = value;
  }

  // Selected station
  final Rx<Station?> _selectedStation = Rx<Station?>(null);
  Station? get selectedStation => _selectedStation.value;
  set selectedStation(Station? value) {
    _selectedStation.value = value;

    clearPoints();

    if (value != null) {
      fetchPoints();
    }
  }

  // Start station
  final Rx<Station?> _startStation = Rx<Station?>(null);
  Station? get startStation => _startStation.value;
  set startStation(Station? value) {
    _startStation.value = value;
  }

  // End station
  final Rx<Station?> _endStation = Rx<Station?>(null);
  Station? get endStation => _endStation.value;
  set endStation(Station? value) {
    _endStation.value = value;
  }

  // Points
  final Rx<List<LatLng>?> _points = Rx<List<LatLng>?>(null);
  List<LatLng>? get points => _points.value;
  set points(List<LatLng>? value) {
    _points.value = value;
  }

  // Start time
  final Rx<DateTime?> _startTime = Rx<DateTime?>(null);
  DateTime? get startTime => _startTime.value;
  set startTime(DateTime? value) {
    _startTime.value = value;
  }

  // End time
  final Rx<DateTime?> _endTime = Rx<DateTime?>(null);
  DateTime? get endTime => _endTime.value;
  set endTime(DateTime? value) {
    _endTime.value = value;
  }

  Future<void> fetchPoints() async {
    List<LatLng> locations = [];
    List<Station> stations = selectedRoute?.stations ?? [];

    if (stations.isEmpty || selectedStation == null) return;

    if (startStation != null) {
      int n = 0;
      while (n < stations.length) {
        if (selectedStation?.id == stations[n++].id) {
          break;
        }
      }

      for (int i = 0; i < n; i++) {
        if (stations[i].location != null) {
          locations.add(stations[i].location!);
        }
      }
    } else if (endStation != null) {
      int i = 0;
      while (i < stations.length) {
        if (selectedStation?.id == stations[i].id) {
          break;
        }
        i++;
      }

      for (; i < stations.length; i++) {
        if (stations[i].location != null) {
          locations.add(stations[i].location!);
        }
      }
    }

    if (locations.isEmpty) return;

    var pointsService = goongRepository.getRoutePoints(locations);

    await callDataService(
      pointsService,
      onSuccess: (List<LatLng> response) {
        points = response;
      },
      onError: ((exception) {
        showToast('Không thể kết nối');
      }),
    );
  }

  void clearPoints() {
    points = [];
  }
}
