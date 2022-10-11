import 'package:get/get.dart';

import '../data/repository/repository.dart';
import '../data/repository/repository_impl.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Repository>(
      () => RepositoryImpl(),
      tag: (Repository).toString(),
    );
  }
}
