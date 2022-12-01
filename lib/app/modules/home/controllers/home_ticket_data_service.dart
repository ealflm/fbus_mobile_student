import 'package:fbus_mobile_student/app/core/base/base_controller.dart';
import 'package:get/get.dart';

import '../../../core/utils/auth_service.dart';
import '../../../data/models/student_trip_model.dart';

class HomeTicketDataService extends BaseController {
  final Rx<Ticket?> _ticket = Rx<Ticket?>(null);
  Ticket? get ticket => _ticket.value;
  set ticket(Ticket? value) {
    _ticket.value = value;
  }

  @override
  void onInit() {
    fetchTicket();
    super.onInit();
  }

  Future<void> fetchTicket() async {
    String studentId = AuthService.student?.id ?? '';
    var fetchTicketService = repository.getCurrentTicket(studentId);

    await callDataService(
      fetchTicketService,
      onSuccess: (Ticket response) {
        ticket = response;
      },
      onError: (exception) {},
    );
  }
}
