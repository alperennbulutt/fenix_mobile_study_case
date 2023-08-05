import 'package:fenix_mobile_study_case/src/constants/endpoints.dart';
import 'package:fenix_mobile_study_case/src/controller/home/home_controller.dart';
import 'package:fenix_mobile_study_case/src/ui/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisplayMoviesWidget extends GetWidget<HomeController> {
  const DisplayMoviesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() => controller.searchCircular.value
          ? const LoadingWidget()
          // Gridview yerine GridView.builder kullandım. Performans açısından daha iyi olduğu için.
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: Get.height * 0.41),
              itemCount: controller.movieModel.results == null
                  ? 0
                  : controller.movieModel.results!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: const Color.fromARGB(255, 227, 225, 225),
                    child: Column(
                      children: [
                        Text(
                          controller.movieTitleList[index],
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // cached_network_image'de kullanılabilirdi fakat her karakterde ara yapılacak şekilde kodu yazdığımdan dolayı
                        // gereksiz kütüphane kullanmaktansa framework widget'larını tercih ettim.
                        Image.network(
                          '${EndPoint.displayMoviePosterUrl}${controller.movieImageList[index]}',
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) =>
                              const Text("image not found"),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
    );
  }
}
