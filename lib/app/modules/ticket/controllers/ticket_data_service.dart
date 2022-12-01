import 'package:fbus_mobile_student/app/core/base/base_controller.dart';
import 'package:get/get.dart';

import '../../../core/utils/auth_service.dart';
import '../../../data/models/student_trip_model.dart';

class TicketDataService extends BaseController {
  final Rx<bool> _isLoading = Rx<bool>(false);
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) {
    _isLoading.value = value;
  }

  final Rx<List<Ticket>?> _tickets = Rx<List<Ticket>?>(null);
  List<Ticket>? get tickets => _tickets.value;
  set tickets(List<Ticket>? value) {
    // value?.sort(((a, b) {
    //   DateTime? aDate = a.trip?.date;
    //   DateTime? bDate = a.trip?.date;
    //   if (aDate == null || bDate == null) return 0;
    //   return aDate.compareTo(bDate);
    // }));
    _tickets.value = value;
  }

  List<Ticket> get todayTickets {
    List<Ticket> result = [];
    for (Ticket ticket in tickets ?? []) {
      if (ticket.trip!.date == null) continue;

      DateTime date = ticket.trip!.date!;
      DateTime now = DateTime.now();

      if (compareDate(date, now) == 0) {
        result.add(ticket);
      }
    }
    return result;
  }

  List<Ticket> get pastTickets {
    List<Ticket> result = [];
    for (Ticket ticket in tickets ?? []) {
      if (ticket.trip!.date == null) continue;
      DateTime date = ticket.trip!.date!;
      DateTime now = DateTime.now();

      if (compareDate(date, now) < 0) {
        result.add(ticket);
      }
    }
    return result;
  }

  List<Ticket> get futureTickets {
    List<Ticket> result = [];
    for (Ticket ticket in tickets ?? []) {
      if (ticket.trip!.date == null) continue;
      DateTime date = ticket.trip!.date!;
      DateTime now = DateTime.now();

      if (compareDate(date, now) > 0) {
        result.add(ticket);
      }
    }
    return result;
  }

  int compareDate(DateTime a, DateTime b) {
    DateTime tripDate = DateTime(a.year, a.month, a.day);
    DateTime todayDate = DateTime(b.year, b.month, b.day);
    return tripDate.compareTo(todayDate);
  }

  Future<void> fetchTickets() async {
    isLoading = true;
    String studentId = AuthService.student?.id ?? '';
    var fetchTicketsService = repository.getTickets(studentId);

    await callDataService(
      fetchTicketsService,
      onSuccess: (List<Ticket> response) {
        tickets = response;
      },
      onError: (exception) {},
    );
    isLoading = false;
  }
}
