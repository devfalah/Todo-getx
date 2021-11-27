import 'package:get/get.dart';
import 'package:todo_getx/app/modules/home/controllers/task_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    // ignore: cascade_invocations
    Get.lazyPut<TaskController>(
      () => TaskController(),
    );
  }
}
