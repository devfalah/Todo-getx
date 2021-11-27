import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/app/core/theme/theme.dart';
import 'package:todo_getx/app/core/utils/size_config.dart';

class BottomSheetButton extends StatelessWidget {
  const BottomSheetButton({
    Key? key,
    required this.label,
    required this.onTap,
    required this.clr,
    this.isClose = false,
  }) : super(key: key);
  final String label;
  final Function() onTap;
  final Color clr;
  final bool isClose;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 65,
        width: SizeConfig.screenWidth * 0.9,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isClose
                ? Get.isDarkMode
                    ? Colors.grey[600]!
                    : Colors.grey[300]!
                : clr,
          ),
          borderRadius: BorderRadius.circular(20),
          color: isClose ? Colors.transparent : clr,
        ),
        child: Center(
          child: Text(
            label,
            style: isClose
                ? titleStyle
                : titleStyle.copyWith(
                    color: Colors.white,
                  ),
          ),
        ),
      ),
    );
  }
}
