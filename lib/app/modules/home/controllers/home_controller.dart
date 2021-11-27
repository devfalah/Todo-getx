import 'package:get/get.dart';
import 'package:todo_getx/app/core/theme/theme_services.dart';
import 'package:todo_getx/app/data/services/notification_services.dart';

class HomeController extends GetxController {
  static final HomeController to = Get.find();
  var selectedDate = Rxn(DateTime.now());

  @override
  Future<void> onInit() async {
    NotificationServices()
      ..requestIOSPermissions()
      ..initializeNotification();
    super.onInit();
  }

  @override
  void onClose() {}
  void switchTheme() => ThemeServices().switchTheme();

  void onDateChange(DateTime date) => selectedDate(date);
}
