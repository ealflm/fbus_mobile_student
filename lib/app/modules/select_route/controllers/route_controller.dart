import 'package:fbus_mobile_student/app/core/base/base_controller.dart';

import '../../../core/widget/shared.dart';
import '../../../data/models/route_model.dart';

class RouteController extends BaseController {
  List<Route> routes = [];

  Future<void> fetchRoutes() async {
    var routesService = repository.getRoute();

    await callDataService(
      routesService,
      onSuccess: (List<Route> response) {
        routes = response;
      },
      onError: ((exception) {
        showToast('Không thể kết nối');
      }),
    );
  }
}
