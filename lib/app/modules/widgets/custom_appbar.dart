import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/app/core/theme/theme.dart';

AppBar customAppBar() => AppBar(
      leading: IconButton(
        onPressed: Get.back,
        icon: Icon(
          Icons.arrow_back_ios_new,
          size: 24,
          color: Get.isDarkMode ? Colors.white : darkGreyClr,
        ),
      ),
      elevation: 0.0,
      backgroundColor: Get.theme.backgroundColor,
    );
