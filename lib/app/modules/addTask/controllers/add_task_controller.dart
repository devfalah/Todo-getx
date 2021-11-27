import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_getx/app/core/theme/theme.dart';
import 'package:todo_getx/app/core/utils/convert_time.dart';
import 'package:todo_getx/app/data/models/task.dart';
import 'package:todo_getx/app/data/services/notification_services.dart';
import 'package:todo_getx/app/modules/home/controllers/task_controller.dart';

class AddTaskController extends GetxController {
  static final AddTaskController to = Get.find();
  late TextEditingController titleController;
  late TextEditingController noteController;
  late Rxn<DateTime> selectedDate;
  late RxString startDate;
  late RxString endDate;
  RxInt selectedRemind = 5.obs;
  RxString selectedRepeat = 'None'.obs;
  RxInt selectedColor = 0.obs;
  final List<int> remindList = [5, 10, 15, 20];
  final List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];
  final List<Color> colors = <Color>[bluishClr, pinkClr, orangeClr];

  @override
  void onInit() {
    titleController = TextEditingController();
    noteController = TextEditingController();
    selectedDate = Rxn(DateTime.now());
    startDate = DateTime.now().formatDate.obs;
    endDate = DateTime.now().add(const Duration(hours: 1)).formatDate.obs;
    super.onInit();
  }

  @override
  void onClose() {}
  void onChangedRemind(String? value) =>
      selectedRemind(int.parse(value ?? '5'));
  void onChangedRepeat(String? value) => selectedRepeat(value);
  void changeColor(Color value) => selectedColor(colors.indexOf(value));
  addTask() async {
    final task = Task(
      title: titleController.text,
      note: noteController.text,
      date: selectedDate.value!.formatDateYMD,
      startTime: startDate.value,
      endTime: endDate.value,
      color: selectedColor.value,
      remind: selectedRemind.value,
      repeat: selectedRepeat.value,
    );

    final id = await TaskController.to.addTask(task);

    var date = DateFormat.jm().parse(task.startTime!);
    var myTime = DateFormat('HH:mm').format(date);

    NotificationServices().scheduledNotification(
      int.parse(myTime.split(':')[0]),
      int.parse(myTime.split(':')[1]),
      task,
      id,
    );

    Get.back();
  }
}
