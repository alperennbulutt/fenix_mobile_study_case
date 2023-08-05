import 'package:fenix_mobile_study_case/src/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBarWidget extends GetWidget<HomeController> {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        onChanged: (value) => controller.searchMovie(value),

        // controller.filterMovies(value),
        controller: controller.searchController,
        decoration: InputDecoration(
          labelText: 'Search',
          suffixIcon: InkWell(
              onTap: () {
                controller.searchMovie(controller.searchController.text);
              },
              child: const Icon(Icons.search)),
          errorText: controller.validate.value
              ? 'Value must contain at least two characters'
              : null,
        ),
      ),
    );
  }
}
