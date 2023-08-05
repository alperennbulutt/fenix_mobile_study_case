import 'package:get/get.dart';
import 'package:fenix_mobile_study_case/src/bindings/home_binding.dart';
import 'package:fenix_mobile_study_case/src/ui/home/home_page.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL, page: () => HomePage(), binding: HomeBinding()),
  ];
}
