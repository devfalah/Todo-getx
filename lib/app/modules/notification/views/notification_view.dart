import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_getx/app/core/theme/theme.dart';
import 'package:todo_getx/app/modules/widgets/custom_appbar.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Column(
        children: [
          Column(
            children: [
              Text(
                'Hello',
                style: headingStyle,
              ),
              const SizedBox(height: 10),
              Text(
                'You have new reminder',
                style: body2Style,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: primaryClr,
              ),
              child: ListView(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.text_format,
                        color: Colors.white,
                        size: 30,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        'Title',
                        style: heading2Style,
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    controller.title,
                    style: subHeading2Style,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Icon(
                        Icons.description,
                        color: Colors.white,
                        size: 30,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        'Description',
                        style: heading2Style,
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    controller.note,
                    style: subHeading2Style,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        'Date',
                        style: heading2Style,
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    controller.date,
                    style: subHeading2Style,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
