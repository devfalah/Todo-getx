import 'package:flutter/material.dart';
import '../../core/theme/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.label,
    this.onTap,
  }) : super(key: key);
  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 100,
        height: 45,
        decoration: BoxDecoration(
          color: primaryClr,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
