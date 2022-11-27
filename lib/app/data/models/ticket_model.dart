import 'package:fbus_mobile_student/app/core/widget/shared.dart';
import 'package:intl/intl.dart';

class TicketModel {
  String startStation;
  String endStation;
  DateTime startTime;
  DateTime endTime;
  double distance;
  Duration estimatedTime;

  String get startTimeStr {
    return DateFormat('hh:mm a').format(startTime);
  }

  String get endTimeStr {
    return DateFormat('hh:mm a').format(endTime);
  }

  String get distanceStr {
    return '$distance km';
  }

  String get estimatedTimeStr {
    return formatDurationOnlyHourMinite(estimatedTime);
  }

  String get date {
    return DateFormat('dd/MM/yyyy').format(startTime);
  }

  TicketModel({
    required this.startStation,
    required this.endStation,
    required this.startTime,
    required this.endTime,
    required this.distance,
    required this.estimatedTime,
  });
}
