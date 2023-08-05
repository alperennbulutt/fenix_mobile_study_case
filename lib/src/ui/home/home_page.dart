import 'package:fenix_mobile_study_case/src/ui/home/widgets/display_movies.dart';
import 'package:fenix_mobile_study_case/src/ui/home/widgets/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fenix_mobile_study_case/src/controller/home/home_controller.dart';

// ignore: must_be_immutable
class HomePage extends GetView<HomeController> {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(controller.title.value),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.01,
            ),

            // search bar
            const SearchBarWidget(),

            SizedBox(height: Get.height * 0.02),

            const DisplayMoviesWidget(),
          ],
        ),
      ),
    );
  }
}
