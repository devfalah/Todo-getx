import 'package:get/get.dart';

import 'package:todo_getx/app/modules/addTask/bindings/add_task_binding.dart';
import 'package:todo_getx/app/modules/addTask/views/add_task_view.dart';
import 'package:todo_getx/app/modules/home/bindings/home_binding.dart';
import 'package:todo_getx/app/modules/home/views/home_view.dart';
import 'package:todo_getx/app/modules/notification/bindings/notification_binding.dart';
import 'package:todo_getx/app/modules/notification/views/notification_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.ADD_TASK,
      page: () => const AddTaskView(),
      binding: AddTaskBinding(),
    ),
  ];
}
