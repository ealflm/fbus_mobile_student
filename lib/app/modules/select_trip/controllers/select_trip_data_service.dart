import 'package:fbus_mobile_student/app/core/base/base_controller.dart';
import 'package:get/get.dart';

import '../../../core/widget/shared.dart';
import '../../../data/models/trip_model.dart';

class SelectTripDataService extends BaseController {
  // Trip
  final Rx<List<Trip>?> _trips = Rx<List<Trip>?>(null);
  List<Trip>? get trips => _trips.value;
  set trips(List<Trip>? value) {
    _trips.value = value;
  }

  Future<void> fetchTrip(String routeId, DateTime date) async {
    var tripService = repository.getTrip(routeId, date);

    await callDataService(
      tripService,
      onSuccess: (List<Trip> response) {
        trips = response;
      },
      onError: (exception) {
        showToast('Không thể kết nối');
      },
    );
  }
}
