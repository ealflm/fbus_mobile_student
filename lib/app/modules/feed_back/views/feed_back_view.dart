import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/feed_back_controller.dart';

class FeedBackView extends GetView<FeedBackController> {
  const FeedBackView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FeedBackView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'FeedBackView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
