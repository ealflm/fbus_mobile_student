import 'dart:convert';

import 'package:intl/intl.dart';

import '../../core/utils/utils.dart';
import 'direction_model.dart';
import 'route_model.dart';
import 'station_model.dart';
import 'trip_model.dart';

class Ticket {
  String? id;
  Trip? trip;
  Station? selectedStation;
  Route? route;
  Direction? direction;
  double? rate;
  String? feedBack;
  DateTime? createdDate;
  DateTime? modifiedDate;
  bool? type;
  int? status;

  bool get isPassed {
    if (trip!.date == null) return true;
    return DateTime.now().compareTo(trip!.date!) > 0;
  }

  Station? get fromStation {
    if (type == false) {
      return route?.stations?.first;
    } else {
      return selectedStation;
    }
  }

  Station? get toStation {
    if (type == true) {
      return route?.stations?.last;
    } else {
      return selectedStation;
    }
  }

  String get startTimeStr {
    if (trip == null || direction == null || trip?.startTime == null) {
      return '-';
    }
    if (type == true && direction!.duration != null) {
      return DateFormat('HH:mm').format(
          DateTime(1, 1, 1).add(trip!.endTime!).subtract(direction!.duration!));
    }
    return DateFormat('HH:mm').format(DateTime(1, 1, 1).add(trip!.startTime!));
  }

  String get endTimeStr {
    if (trip == null || direction == null || trip?.endTime == null) {
      return '-';
    }
    if (type == false && direction!.duration != null) {
      return DateFormat('HH:mm').format(
          DateTime(1, 1, 1).add(trip!.startTime!).add(direction!.duration!));
    }
    return DateFormat('HH:mm').format(DateTime(1, 1, 1).add(trip!.endTime!));
  }

  String get distanceStr {
    if (direction != null && direction?.distance != null) {
      double value = direction!.distance! / 1000;
      return value.toStringAsFixed(1);
    } else {
      return '-';
    }
  }

  String get estimatedTimeStr {
    if (direction == null || direction!.duration == null) return '-';
    return formatDurationOnlyHourMinite(direction!.duration!);
  }

  Ticket({
    this.id,
    this.trip,
    this.selectedStation,
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
    selectedStation = Station.fromJson(json['station']);
    Map<String, dynamic> routeJson = jsonDecode(json['copyOfRoute'] ?? '{}');
    route = Route.fromJsonCapitalizeFirstLetter(routeJson);
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
