import 'package:get/get.dart';

class NotificationController extends GetxController {
  final payload = Get.arguments['payload'];
  late String title;
  late String note;
  late String date;
  @override
  void onInit() {
    title = payload.toString().split('|')[0];
    note = payload.toString().split('|')[1];
    date = payload.toString().split('|')[2];

    super.onInit();
  }

  @override
  void onClose() {}
}
