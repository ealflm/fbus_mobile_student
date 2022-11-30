import 'package:fbus_mobile_student/app/core/base/base_controller.dart';
import 'package:get/get.dart';

import '../../../core/utils/auth_service.dart';
import '../../../data/models/student_trip_model.dart';

class TicketDataService extends BaseController {
  final Rx<List<Ticket>?> _tickets = Rx<List<Ticket>?>(null);
  List<Ticket>? get tickets => _tickets.value;
  set tickets(List<Ticket>? value) {
    _tickets.value = value;
  }

  Future<void> fetchTickets() async {
    String studentId = AuthService.student?.id ?? '';
    var fetchTicketsService = repository.getTickets(studentId);

    await callDataService(
      fetchTicketsService,
      onSuccess: (List<Ticket> response) {
        tickets = response;
      },
      onError: (exception) {},
    );
  }
}
