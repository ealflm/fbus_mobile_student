import 'package:get/get.dart';

import '../../../data/models/notification_model.dart';

class NotificationController extends GetxController {
  Rx<List<Notification>> notifications = Rx<List<Notification>>([]);

  String nam = 'text';

  @override
  void onInit() {
    updateNotification();
    super.onInit();
  }

  void updateNotification() {
    List<Notification> result = [];

    result.add(
      Notification(
        id: '1',
        title: 'Xe sắp đến điểm đón',
        message: 'Bạn có một chuyến xe vào lúc 13:50',
        createdDate: DateTime.now(),
      ),
    );

    result.add(
      Notification(
        id: '1',
        title: 'Xe sắp đến điểm đón',
        message: 'Bạn có một chuyến xe vào lúc 10:30',
        createdDate: DateTime.now(),
      ),
    );

    result.add(
      Notification(
        id: '1',
        title: 'Xe sắp đến điểm đón',
        message: 'Bạn có một chuyến xe vào lúc 6:35',
        createdDate: DateTime.now(),
      ),
    );

    result.add(
      Notification(
        id: '1',
        title: 'Xe sắp đến điểm đón',
        message: 'Bạn có một chuyến xe vào lúc 17:30',
        createdDate: DateTime.now().subtract(const Duration(days: 1)),
      ),
    );

    result.add(
      Notification(
        id: '1',
        title: 'Xe sắp đến điểm đón',
        message: 'Bạn có một chuyến xe vào lúc 15:30',
        createdDate: DateTime.now().subtract(const Duration(days: 3)),
      ),
    );

    result.add(
      Notification(
        id: '1',
        title: 'Xe sắp đến điểm đón',
        message: 'Bạn có một chuyến xe vào lúc 13:30',
        createdDate: DateTime.now().subtract(const Duration(days: 5)),
      ),
    );

    result.add(
      Notification(
        id: '1',
        title: 'Xe sắp đến điểm đón',
        message: 'Bạn có một chuyến xe vào lúc 9:10',
        createdDate: DateTime.now().subtract(const Duration(days: 8)),
      ),
    );

    result.sort(((a, b) {
      return b.createdDate?.compareTo(a.createdDate!) ?? 0;
    }));

    bool flag = false;
    for (Notification item in result) {
      if (compare(item.createdDate, DateTime.now()) && flag == false) {
        item.filter = 0;
        flag = true;
      } else if (!compare(item.createdDate, DateTime.now()) && flag == true) {
        item.filter = 1;
        break;
      }
    }

    notifications(result);
  }

  bool compare(DateTime? a, DateTime? b) {
    if (a == null || b == null) return false;
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
