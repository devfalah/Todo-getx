import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:todo_getx/app/core/theme/theme.dart';
import 'package:todo_getx/app/modules/home/controllers/home_controller.dart';

class DateBar extends StatelessWidget {
  const DateBar({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 6, left: 20),
      child: DatePicker(
        DateTime.now(),
        width: 80,
        height: 100,
        selectionColor: primaryClr,
        onDateChange: controller.onDateChange,
        monthTextStyle: subTitleStyle,
        dateTextStyle: subTitleStyle,
        dayTextStyle: subTitleStyle,
      ),
    );
  }
}
