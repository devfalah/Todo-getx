import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/core/db/db_helper.dart';
import 'app/core/theme/theme.dart';
import 'app/core/theme/theme_services.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  await GetStorage.init();
  await DBHelper.db.initDb();

  runApp(
    GetMaterialApp(
      title: "TODO",
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().themeMode,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
