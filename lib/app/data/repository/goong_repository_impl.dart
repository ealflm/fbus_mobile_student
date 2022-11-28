import 'package:latlong2/latlong.dart';

import '../../core/base/base_repository.dart';
import '../../core/utils/map_polyline_utils.dart';
import 'goong_repository.dart';

class GoongRepositoryImpl extends BaseRepository implements GoongRepository {
  @override
  Future<List<LatLng>> getRoutePoints(List<LatLng> locations) {
    if (locations.length < 2) {
      return Future<List<LatLng>>.value([]);
    }
    var endpoint = 'https://rsapi.goong.io/Direction';

    var origin = '${locations[0].latitude},${locations[0].longitude}';
    var destination = '';
    for (int i = 1; i < locations.length; i++) {
      destination += '${locations[i].latitude},${locations[i].longitude}';
      if (i != locations.length - 1) {
        destination += ';';
      }
    }

    var param = {
      'vehicle': 'car',
      'alternatives': false,
      'origin': origin,
      'destination': destination,
    };
    var dioCall = dioGoong.get(
      endpoint,
      queryParameters: param,
    );

    try {
      return callApi(dioCall).then((response) {
        String overviewPolylineCode =
            response.data['routes'][0]['overview_polyline']['points'];
        return MapPolylineUtils.decode(overviewPolylineCode);
      });
    } catch (e) {
      return Future<List<LatLng>>.value([]);
    }
  }
}
