import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controllers/ticket_controller.dart';

class UsedView extends GetView<TicketController> {
  const UsedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Đã sử dụng'));
  }
}
