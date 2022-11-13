import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_svg_assets.dart';
import '../../map/hyper_map_controller.dart';

class SelectRouteController extends GetxController {
  HyperMapController hyperMapController = HyperMapController();

  List<Station> stations = [];
  Rx<List<Marker>> stationMarkers = Rx<List<Marker>>([]);

  Rx<List<LatLng>> polyLines = Rx<List<LatLng>>([]);

  @override
  void onInit() {
    updateStations();
    updatePolyLines();
    super.onInit();
  }

  void updatePolyLines() {
    List<LatLng> result = [
      LatLng(
        10.841548,
        106.809008,
      ),
      LatLng(
        10.841498,
        106.808953,
      ),
      LatLng(
        10.84163,
        106.808815,
      ),
      LatLng(
        10.841772,
        106.808669,
      ),
      LatLng(
        10.841822,
        106.808617,
      ),
      LatLng(
        10.842241,
        106.808185,
      ),
      LatLng(
        10.84263,
        106.807784,
      ),
      LatLng(
        10.842904,
        106.807495,
      ),
      LatLng(
        10.842936,
        106.807465,
      ),
      LatLng(
        10.842965,
        106.807436,
      ),
      LatLng(
        10.843,
        106.807403,
      ),
      LatLng(
        10.843037,
        106.807365,
      ),
      LatLng(
        10.843217,
        106.807185,
      ),
      LatLng(
        10.843408,
        106.807357,
      ),
      LatLng(
        10.843765,
        106.807716,
      ),
      LatLng(
        10.843773,
        106.807724,
      ),
      LatLng(
        10.844002,
        106.807935,
      ),
      LatLng(
        10.844141,
        106.808167,
      ),
      LatLng(
        10.844178,
        106.808307,
      ),
      LatLng(
        10.844191,
        106.80845,
      ),
      LatLng(
        10.844157,
        106.808675,
      ),
      LatLng(
        10.843702,
        106.8099,
      ),
      LatLng(
        10.843641,
        106.809997,
      ),
      LatLng(
        10.843585,
        106.810066,
      ),
      LatLng(
        10.843115,
        106.810472,
      ),
      LatLng(
        10.843016,
        106.810579,
      ),
      LatLng(
        10.842941,
        106.810681,
      ),
      LatLng(
        10.842394,
        106.811963,
      ),
      LatLng(
        10.842339,
        106.812062,
      ),
      LatLng(
        10.842273,
        106.812153,
      ),
      LatLng(
        10.842189,
        106.812236,
      ),
      LatLng(
        10.842083,
        106.812313,
      ),
      LatLng(
        10.841343,
        106.812677,
      ),
      LatLng(
        10.841224,
        106.812734,
      ),
      LatLng(
        10.841112,
        106.812806,
      ),
      LatLng(
        10.841023,
        106.812887,
      ),
      LatLng(
        10.840931,
        106.812986,
      ),
      LatLng(
        10.840788,
        106.813152,
      ),
      LatLng(
        10.841155,
        106.813498,
      ),
      LatLng(
        10.841658,
        106.813966,
      ),
      LatLng(
        10.842088,
        106.814386,
      ),
      LatLng(
        10.842165,
        106.814465,
      ),
      LatLng(
        10.842821,
        106.815112,
      ),
      LatLng(
        10.842956,
        106.815241,
      ),
      LatLng(
        10.843119,
        106.815057,
      ),
      LatLng(
        10.843695,
        106.814411,
      ),
      LatLng(
        10.844578,
        106.813438,
      ),
      LatLng(
        10.844697,
        106.813315,
      ),
      LatLng(
        10.845055,
        106.81293,
      ),
      LatLng(
        10.846428,
        106.811449,
      ),
      LatLng(
        10.846816,
        106.811031,
      ),
      LatLng(
        10.847075,
        106.810752,
      ),
      LatLng(
        10.847675,
        106.810105,
      ),
      LatLng(
        10.84877,
        106.808894,
      ),
      LatLng(
        10.848925,
        106.808728,
      ),
      LatLng(
        10.849275,
        106.810155,
      ),
      LatLng(
        10.849333,
        106.810373,
      ),
      LatLng(
        10.849549,
        106.811284,
      ),
      LatLng(
        10.849562,
        106.811337,
      ),
      LatLng(
        10.849645,
        106.811697,
      ),
      LatLng(
        10.84982,
        106.812419,
      ),
      LatLng(
        10.849894,
        106.81271,
      ),
      LatLng(
        10.850087,
        106.813465,
      ),
      LatLng(
        10.850159,
        106.813728,
      ),
      LatLng(
        10.850082,
        106.813765,
      ),
      LatLng(
        10.850005,
        106.813814,
      ),
      LatLng(
        10.84986,
        106.813923,
      ),
      LatLng(
        10.849714,
        106.814034,
      ),
      LatLng(
        10.849627,
        106.814101,
      ),
      LatLng(
        10.849178,
        106.814434,
      ),
      LatLng(
        10.848875,
        106.814659,
      ),
      LatLng(
        10.848547,
        106.814903,
      ),
      LatLng(
        10.848425,
        106.814998,
      ),
      LatLng(
        10.847982,
        106.815325,
      ),
      LatLng(
        10.847344,
        106.815825,
      ),
      LatLng(
        10.846897,
        106.816175,
      ),
      LatLng(
        10.846839,
        106.816222,
      ),
      LatLng(
        10.846368,
        106.816606,
      ),
      LatLng(
        10.846179,
        106.81675,
      ),
      LatLng(
        10.845568,
        106.817216,
      ),
      LatLng(
        10.845441,
        106.81731,
      ),
      LatLng(
        10.84482,
        106.81777,
      ),
      LatLng(
        10.84441,
        106.818073,
      ),
      LatLng(
        10.844348,
        106.818118,
      ),
      LatLng(
        10.84422,
        106.818211,
      ),
      LatLng(
        10.843918,
        106.818426,
      ),
      LatLng(
        10.843614,
        106.818657,
      ),
      LatLng(
        10.843554,
        106.818709,
      ),
      LatLng(
        10.843506,
        106.818648,
      ),
      LatLng(
        10.843554,
        106.818709,
      ),
      LatLng(
        10.843444,
        106.818821,
      ),
      LatLng(
        10.843285,
        106.819024,
      ),
      LatLng(
        10.843132,
        106.819235,
      ),
      LatLng(
        10.842933,
        106.819509,
      ),
      LatLng(
        10.842906,
        106.819547,
      ),
      LatLng(
        10.842542,
        106.820078,
      ),
      LatLng(
        10.842518,
        106.820113,
      ),
      LatLng(
        10.84223,
        106.820544,
      ),
      LatLng(
        10.842196,
        106.820589,
      ),
      LatLng(
        10.842063,
        106.820785,
      ),
      LatLng(
        10.84193,
        106.82098,
      ),
      LatLng(
        10.84186,
        106.821084,
      ),
      LatLng(
        10.841767,
        106.821217,
      ),
      LatLng(
        10.841696,
        106.821319,
      ),
      LatLng(
        10.841525,
        106.821568,
      ),
      LatLng(
        10.841472,
        106.821671,
      ),
      LatLng(
        10.841434,
        106.821764,
      ),
      LatLng(
        10.841398,
        106.821917,
      ),
      LatLng(
        10.841392,
        106.822051,
      ),
      LatLng(
        10.841374,
        106.8225,
      ),
      LatLng(
        10.841338,
        106.823025,
      ),
      LatLng(
        10.841328,
        106.823174,
      ),
      LatLng(
        10.841303,
        106.823452,
      ),
      LatLng(
        10.841298,
        106.823503,
      ),
      LatLng(
        10.841294,
        106.823538,
      ),
      LatLng(
        10.841287,
        106.823594,
      ),
      LatLng(
        10.841282,
        106.823659,
      ),
      LatLng(
        10.841235,
        106.824231,
      ),
      LatLng(
        10.8412,
        106.824596,
      ),
      LatLng(
        10.84117,
        106.825002,
      ),
      LatLng(
        10.841163,
        106.825041,
      ),
      LatLng(
        10.841118,
        106.825506,
      ),
      LatLng(
        10.841073,
        106.825776,
      ),
      LatLng(
        10.841063,
        106.825863,
      ),
      LatLng(
        10.841039,
        106.826018,
      ),
      LatLng(
        10.841027,
        106.826146,
      ),
      LatLng(
        10.841035,
        106.826308,
      ),
      LatLng(
        10.841052,
        106.826435,
      ),
      LatLng(
        10.84109,
        106.826562,
      ),
      LatLng(
        10.841142,
        106.826687,
      ),
      LatLng(
        10.841196,
        106.826765,
      ),
      LatLng(
        10.841282,
        106.826871,
      ),
      LatLng(
        10.841817,
        106.827498,
      ),
      LatLng(
        10.842141,
        106.827872,
      ),
      LatLng(
        10.842164,
        106.8279,
      ),
      LatLng(
        10.84238,
        106.82815,
      ),
      LatLng(
        10.842721,
        106.82856,
      )
    ];

    polyLines(result);
  }

  void updateStations() {
    stations.add(
      Station(
        title: 'FPT University',
        address:
            'Lô E2a-7, Đường D1, Đ. D1, Long Thạnh Mỹ, Thành Phố Thủ Đức, Thành phố Hồ Chí Minh',
        location: LatLng(10.841567123475343, 106.80898942710063),
      ),
    );
    stations.add(
      Station(
        title: 'Vinhomes Grand Park',
        address: 'Nguyễn Xiển, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh',
        location: LatLng(10.845082, 106.812956),
      ),
    );
    stations.add(
      Station(
        title: '354 Nguyễn Văn Tăng',
        address: 'Long Thạnh Mỹ, District 9, Ho Chi Minh City, Vietnam',
        location: LatLng(10.849830, 106.812727),
      ),
    );
    stations.add(
      Station(
        title: 'Trường ĐH Nguyễn Tất Thành',
        address: 'Long Thạnh Mỹ, District 9, Ho Chi Minh City, Vietnam',
        location: LatLng(10.843534, 106.818625),
      ),
    );
    stations.add(
      Station(
        title: 'Công Ty Mekophar',
        address: 'Long Thạnh Mỹ, District 9, Ho Chi Minh City, Vietnam',
        location: LatLng(10.842686, 106.828594),
      ),
    );

    // Another
    stations.add(
      Station(
        title: 'Công Ty Filied Lê Văn Việt',
        address: 'Long Thạnh Mỹ, District 9, Ho Chi Minh City, Vietnam',
        location: LatLng(10.849322192020587, 106.80087176970181),
      ),
    );
    stations.add(
      Station(
        title: 'Intel Products Vietnam',
        address:
            'Hi-Tech Park, Lô I2, Đ. D1, Phường Tân Phú, Quận 9, Thành phố Hồ Chí Minh, Vietnam',
        location: LatLng(10.851058, 106.799028),
      ),
    );
    stations.add(
      Station(
        title: 'Khu Công nghệ cao TP.HCM',
        address:
            'Phường Tân Phú, Thành phố Thủ Đức, Thành phố Hồ Chí Minh, Vietnam',
        location: LatLng(10.857539, 106.786016),
      ),
    );

    List<Marker> items = [];
    for (Station station in stations) {
      var item = Marker(
        width: 80.r,
        height: 80.r,
        point: station.location,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(20.r),
            child: GestureDetector(
              onTap: () {
                //
              },
              child: Container(
                color: AppColors.white.withOpacity(0),
                padding: EdgeInsets.all(10.r),
                child: SvgPicture.asset(
                  AppSvgAssets.busIcon,
                ),
              ),
            ),
          );
        },
      );
      items.add(item);
    }

    stationMarkers(items);
  }

  void onMapReady() async {
    await hyperMapController.refreshCurrentLocation();
    hyperMapController.moveToCurrentLocationWithoutAnimation();
  }
}

class Station {
  String title;
  String address;
  LatLng location;

  Station({required this.title, required this.address, required this.location});
}
