import 'package:get/get.dart';

class SelectTripController extends GetxController {
  final Rx<DateTime?> _selectedDay = Rx<DateTime?>(null);
  DateTime? get selectedDay => _selectedDay.value;
  set selectedDay(DateTime? value) {
    _selectedDay.value = value;
  }

  final Rx<DateTime?> _focusedDay = Rx<DateTime?>(null);
  DateTime? get focusedDay => _focusedDay.value;
  set focusedDay(DateTime? value) {
    _focusedDay.value = value;
  }
}
