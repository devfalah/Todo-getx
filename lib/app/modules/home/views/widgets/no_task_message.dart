import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_getx/app/core/theme/theme.dart';
import 'package:todo_getx/app/core/utils/size_config.dart';

class NoTaskMessage extends StatelessWidget {
  const NoTaskMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ListView(
      children: [
        SizeConfig.orientation == Orientation.landscape
            ? const SizedBox(height: 0)
            : const SizedBox(height: 20),
        Lottie.asset('assets/lottie/notasks.json', width: 100, height: 250),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            'You do not have any tasks yet !\nAdd new tasks to make your days productive.',
            style: bodyStyle.copyWith(
                fontSize: 16, color: context.textTheme.bodyText1!.color),
            textAlign: TextAlign.center,
          ),
        ),
        SizeConfig.orientation == Orientation.landscape
            ? const SizedBox(height: 80)
            : const SizedBox(height: 180),
      ],
    );
  }
}
