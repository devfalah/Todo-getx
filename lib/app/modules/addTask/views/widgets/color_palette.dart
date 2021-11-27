import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/app/core/theme/theme.dart';
import 'package:todo_getx/app/modules/addTask/controllers/add_task_controller.dart';

class ColorPalette extends StatelessWidget {
  const ColorPalette({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final AddTaskController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Color', style: titleStyle),
        Row(
          children: controller.colors
              .map(
                (color) => Obx(
                  () => GestureDetector(
                    onTap: () => controller.changeColor(color),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: CircleAvatar(
                        backgroundColor: color,
                        radius: 16,
                        child:
                            controller.colors[controller.selectedColor.value] ==
                                    color
                                ? const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : null,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
