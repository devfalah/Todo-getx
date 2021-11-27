import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_getx/app/core/db/db_helper.dart';
import 'package:todo_getx/app/data/models/task.dart';
import 'package:todo_getx/app/modules/home/controllers/home_controller.dart';

class TaskController extends GetxController {
  static final TaskController to = Get.find();
  final db = DBHelper.db;
  List<Task> get tasks => _tasks
      .where((task) =>
          task.repeat == 'Daily' ||
          task.date ==
              DateFormat()
                  .add_yMd()
                  .format(HomeController.to.selectedDate.value!))
      .toList();
  final _tasks = <Task>[].obs;
  @override
  Future<void> onInit() async {
    await getTasks();
    super.onInit();
  }

  Future<void> getTasks() async {
    _tasks.assignAll(await DBHelper.db.getAllTasks());
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    db.delete(task);
  }

  Future<void> markTaskCompleted(int taskId) async {
    await db.update(taskId);
    await getTasks();
  }

  Future<int> addTask(Task task) async {
    final id = await db.insert(task);
    await getTasks();
    return id;
  }
}
