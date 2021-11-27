import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_getx/app/core/theme/theme.dart';
import 'package:todo_getx/app/core/utils/size_config.dart';
import 'package:todo_getx/app/data/models/task.dart';
import 'package:todo_getx/app/data/services/notification_services.dart';
import 'package:todo_getx/app/modules/home/controllers/home_controller.dart';
import 'package:todo_getx/app/modules/home/controllers/task_controller.dart';
import 'package:todo_getx/app/modules/widgets/task_tile.dart';

import 'button_bottom_sheet.dart';
import 'no_task_message.dart';

class Showtasks extends StatelessWidget {
  const Showtasks({
    Key? key,
    required this.controller,
    required this.notificationServices,
    required this.homeController,
  }) : super(key: key);
  final TaskController controller;
  final NotificationServices notificationServices;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => controller.tasks.isEmpty
            ? RefreshIndicator(
                onRefresh: TaskController.to.getTasks,
                child: const NoTaskMessage(),
              )
            : ListView.builder(
                itemCount: controller.tasks.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  final task = controller.tasks[index];
                  var date = DateFormat.jm().parse(task.startTime!);
                  var myTime = DateFormat('HH:mm').format(date);

                  NotificationServices().scheduledNotification(
                    int.parse(myTime.split(':')[0]),
                    int.parse(myTime.split(':')[1]),
                    task,
                    task.id!,
                  );
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    child: SlideAnimation(
                      horizontalOffset: 300,
                      child: FadeInAnimation(
                        child: GestureDetector(
                          onTap: () => showBottomSheet(
                            context,
                            controller.tasks[index],
                            notificationServices,
                          ),
                          child: TaskTile(task),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  showBottomSheet(
      BuildContext context, Task task, NotificationServices notifyHelper) {
    Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 4),
          width: SizeConfig.screenWidth,
          height: (SizeConfig.orientation == Orientation.landscape)
              ? (task.isCompleted
                  ? SizeConfig.screenHeight * 0.6
                  : SizeConfig.screenHeight * 0.8)
              : (task.isCompleted
                  ? SizeConfig.screenHeight * 0.30
                  : SizeConfig.screenHeight * 0.39),
          color: Get.isDarkMode ? darkHeaderClr : Colors.white,
          child: Column(
            children: [
              Flexible(
                child: Container(
                  height: 6,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[300],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              task.isCompleted
                  ? Container()
                  : BottomSheetButton(
                      label: 'Task Completed',
                      onTap: () {
                        notifyHelper.cancelNotification(task);
                        controller.markTaskCompleted(task.id!);
                        Get.back();
                      },
                      clr: primaryClr,
                    ),
              BottomSheetButton(
                label: 'delete Task',
                onTap: () {
                  notifyHelper.cancelNotification(task);
                  controller.deleteTask(task);
                  Get.back();
                },
                clr: Colors.red[300]!,
              ),
              BottomSheetButton(
                label: 'Cancel',
                onTap: () {
                  Get.back();
                },
                clr: primaryClr,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
