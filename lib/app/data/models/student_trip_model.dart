import 'dart:convert';

import 'route_model.dart';
import 'station_model.dart';
import 'trip_model.dart';

class StudentTrip {
  String? id;
  Trip? trip;
  Station? station;
  Route? route;
  double? rate;
  String? feedBack;
  DateTime? createdDate;
  DateTime? modifiedDate;
  bool? type;
  int? status;

  StudentTrip({
    this.id,
    this.trip,
    this.station,
    this.route,
    this.rate,
    this.feedBack,
    this.createdDate,
    this.modifiedDate,
    this.type,
    this.status,
  });

  StudentTrip.fromJson(Map<String, dynamic> json) {
    id = json['studentTripId'];
    trip = Trip.fromJson(json['trip']);
    station = Station.fromJson(json['station']);
    route = Route.fromJson(jsonDecode(json['route']));
    rate = json['rate'];
    feedBack = json['feedBack'];
    createdDate = DateTime.parse(json['createdDate']);
    modifiedDate = DateTime.parse(json['modifiedDate']);
    type = json['type'];
    status = json['status'];
  }
}
