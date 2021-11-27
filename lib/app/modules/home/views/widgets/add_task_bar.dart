import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:todo_getx/app/core/theme/theme.dart';
import 'package:todo_getx/app/core/utils/convert_time.dart';
import 'package:todo_getx/app/modules/widgets/button.dart';
import 'package:todo_getx/app/routes/app_pages.dart';

class AddTaskBar extends StatelessWidget {
  const AddTaskBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateTime.now().formatDateYMMMd,
                style: subHeadingStyle.copyWith(
                    color: context.textTheme.bodyText1!.color),
              ),
              Text(
                "Today",
                style: headingStyle.copyWith(
                    color: context.textTheme.bodyText1!.color),
              ),
            ],
          ),
          CustomButton(
            label: '+ Add Task',
            onTap: () => Get.toNamed(Routes.ADD_TASK),
          )
        ],
      ),
    );
  }
}
