import 'package:get/get.dart';
import 'package:fenix_mobile_study_case/src/controller/home/home_controller.dart';
import 'package:fenix_mobile_study_case/src/data/provider/api.dart';
import 'package:fenix_mobile_study_case/src/data/repository/repository.dart';
import 'package:http/http.dart' as http;

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController(
          repository:
              MyRepository(apiClient: MyApiClient(httpClient: http.Client())));
    });
  }
}
