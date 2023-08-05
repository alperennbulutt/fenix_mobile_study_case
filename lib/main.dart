import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fenix_mobile_study_case/src/routes/app_pages.dart';
import 'package:fenix_mobile_study_case/src/translations/app_translations.dart';

import 'src/ui/theme/app_theme.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.INITIAL,
    theme: appThemeData,
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
    locale: const Locale('pt', 'BR'),
    translationsKeys: AppTranslation.translations,
    themeMode: ThemeMode.system,
  ));
}
