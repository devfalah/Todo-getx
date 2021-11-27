import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo_getx/app/core/theme/theme.dart';

import 'package:todo_getx/app/data/services/notification_services.dart';
import 'package:todo_getx/app/modules/home/controllers/task_controller.dart';
import 'package:todo_getx/app/modules/home/views/widgets/add_task_bar.dart';
import 'package:todo_getx/app/modules/home/views/widgets/date_bar.dart';
import 'package:todo_getx/app/modules/home/views/widgets/show_task.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = HomeController.to;
  final taskController = TaskController.to;
  final notificationServices = NotificationServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _homeAppBar(),
      body: Column(
        children: [
          const AddTaskBar(),
          DateBar(controller: controller),
          Showtasks(
            controller: taskController,
            notificationServices: notificationServices,
            homeController: controller,
          ),
        ],
      ),
    );
  }

  AppBar _homeAppBar() => AppBar(
        leading: IconButton(
          onPressed: controller.switchTheme,
          icon: Icon(
            Get.isDarkMode ? Icons.wb_sunny_rounded : Icons.wb_sunny_outlined,
            size: 24,
            color: Get.isDarkMode ? Colors.white : darkGreyClr,
          ),
        ),
        elevation: 0.0,
        backgroundColor: context.theme.backgroundColor,
      );
}
