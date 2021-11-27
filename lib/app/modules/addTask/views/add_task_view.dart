import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo_getx/app/core/theme/theme.dart';
import 'package:todo_getx/app/core/utils/convert_time.dart';
import 'package:todo_getx/app/core/utils/size_config.dart';
import 'package:todo_getx/app/modules/addTask/views/widgets/color_palette.dart';
import 'package:todo_getx/app/modules/widgets/button.dart';
import 'package:todo_getx/app/modules/widgets/custom_appbar.dart';
import 'package:todo_getx/app/modules/widgets/input_field.dart';

import '../controllers/add_task_controller.dart';

class AddTaskView extends GetView<AddTaskController> {
  const AddTaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: customAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Add Task",
                style: headingStyle,
              ),
              InputField(
                label: 'Title',
                hintText: 'Enter Title Here',
                controller: controller.titleController,
              ),
              InputField(
                label: 'Note',
                hintText: 'Enter Note Here',
                controller: controller.noteController,
              ),
              Obx(
                () => InputField(
                  label: 'Date',
                  hintText: controller.selectedDate.value!.formatDateYMD,
                  widget: IconButton(
                    onPressed: () async {
                      controller.selectedDate(await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 364))))!;
                    },
                    icon: const Icon(Icons.calendar_today_outlined),
                  ),
                ),
              ),
              Row(
                children: [
                  Obx(
                    () => Expanded(
                      child: InputField(
                        label: 'Start Time',
                        hintText: controller.startDate.value,
                        widget: IconButton(
                          onPressed: () async {
                            var _pickedTime = await showTimePicker(
                                context: context, initialTime: TimeOfDay.now());

                            controller.startDate(
                              _pickedTime?.format(context) ??
                                  TimeOfDay.now().format(context),
                            );
                          },
                          icon: const Icon(Icons.access_time_rounded),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Obx(
                    () => Expanded(
                      child: InputField(
                        label: 'End Time',
                        hintText: controller.endDate.value,
                        widget: IconButton(
                          onPressed: () async {
                            var _pickedTime = await showTimePicker(
                                context: context, initialTime: TimeOfDay.now());

                            controller.endDate(_pickedTime!.format(context));
                          },
                          icon: const Icon(Icons.access_time_rounded),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Obx(
                () => InputField(
                  label: 'Remind',
                  hintText: '${controller.selectedRemind} Minute Early',
                  widget: Row(
                    children: [
                      DropdownButton<String>(
                        dropdownColor: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(12),
                        value: controller.selectedRemind.value.toString(),
                        items: controller.remindList
                            .map<DropdownMenuItem<String>>(
                              (int value) => DropdownMenuItem(
                                child: Text(
                                  '$value',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                value: value.toString(),
                              ),
                            )
                            .toList(),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        iconSize: 32,
                        elevation: 4,
                        underline: Container(height: 0),
                        onChanged: controller.onChangedRemind,
                      ),
                      const SizedBox(width: 6),
                    ],
                  ),
                ),
              ),
              Obx(
                () => InputField(
                  label: 'Repeat',
                  hintText: '${controller.selectedRepeat}',
                  widget: Row(
                    children: [
                      DropdownButton<String>(
                        borderRadius: BorderRadius.circular(12),
                        dropdownColor: Colors.blueGrey,
                        value: controller.selectedRepeat.value.toString(),
                        items: controller.repeatList
                            .map<DropdownMenuItem<String>>(
                              (String value) => DropdownMenuItem(
                                child: Text(
                                  value,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                value: value,
                              ),
                            )
                            .toList(),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        iconSize: 32,
                        elevation: 4,
                        underline: Container(height: 0),
                        onChanged: controller.onChangedRepeat,
                      ),
                      const SizedBox(width: 6),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ColorPalette(controller: controller),
                  CustomButton(
                    label: 'Create Task',
                    onTap: controller.addTask,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
