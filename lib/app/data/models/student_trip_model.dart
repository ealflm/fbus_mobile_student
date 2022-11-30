import 'dart:convert';

import 'route_model.dart';
import 'station_model.dart';
import 'trip_model.dart';

class Ticket {
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

  Ticket({
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

  Ticket.fromJson(Map<String, dynamic> json) {
    id = json['studentTripId'];
    trip = Trip.fromJson(json['trip']);
    station = Station.fromJson(json['station']);
    Map<String, dynamic> routeJson = jsonDecode(json['copyOfRoute'] ?? '{}');
    route = Route.fromJson(routeJson);
    rate = json['rate'];
    feedBack = json['feedBack'];
    createdDate =
        json['createDate'] != null ? DateTime.parse(json['createDate']) : null;
    modifiedDate =
        json['modifyDate'] != null ? DateTime.parse(json['modifyDate']) : null;
    type = json['type'];
    status = json['status'];
  }
}
