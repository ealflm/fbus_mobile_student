import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

class MapUtils {
  static LatLngBounds padTop(
      LatLngBounds bounds, double bufferRatio, double bottomBufferRatio) {
    bounds.pad(bufferRatio);
    LatLng? ne = bounds.northEast;
    LatLng? sw = bounds.southWest;
    final heightBuffer =
        (sw!.latitude - ne!.latitude).abs() * bottomBufferRatio;
    sw = LatLng(sw.latitude - heightBuffer, sw.longitude);
    bounds.extend(sw);

    return bounds;
  }
}
