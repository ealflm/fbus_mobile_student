import '../../core/utils/utils.dart';
import 'bus_model.dart';
import 'driver_model.dart';
import 'route_model.dart';

class Trip {
  String? id;
  Bus? bus;
  Driver? driver;
  Route? route;
  DateTime? date;
  Duration? timeStart;
  Duration? timeEnd;
  double? rate;

  Trip({
    this.id,
    this.bus,
    this.driver,
    this.route,
    this.date,
    this.timeStart,
    this.timeEnd,
    this.rate,
  });

  Trip.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bus = Bus.fromJson(json['bus']);
    driver = Driver.fromJson(json['driver']);
    route = Route.fromJson(json['route']);
    date = DateTime.parse(json['date']);
    timeStart = parseDuration(json['timeStart']);
    timeEnd = parseDuration(json['timeEnd']);
    rate = json['rate'];
  }
}
