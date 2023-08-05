import 'package:fenix_mobile_study_case/src/data/model/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/repository/repository.dart';

class HomeController extends GetxController {
  final MyRepository repository;
  HomeController({required this.repository});

  // appbar title
  final title = 'Fenix Mobile Study Case'.obs;

  // search textfield validate state
  final validate = false.obs;

  // search circular
  final searchCircular = false.obs;

  // textfield controller
  TextEditingController searchController = TextEditingController();
  // display title and poster image.
  final movieTitleList = <String>[].obs;
  final movieImageList = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  // serach movie result list
  Rx<List<MovieModel>> results = Rx<List<MovieModel>>([]);

  MovieModel movieModel = MovieModel();

  searchMovie(String movieName) async {
    // en az 2 karakter girilmeli
    if (movieName.length > 2 || movieName.isEmpty) {
      validate.value = false;

      searchCircular.value = true;

      var result = await repository.searchMovie(movieName);
      movieModel = MovieModel.fromJson(result);
      // liste temizlenir
      movieTitleList.clear();
      movieImageList.clear();
      // eğer boş ise listeler temizlenir
      if (movieName.isEmpty) {
        movieTitleList.clear();
        movieImageList.clear();
      } else {
        movieModel.results!.forEach((element) {
          movieTitleList
              .add(element.originalTitle == null ? "" : element.originalTitle!);
          movieImageList
              .add(element.posterPath == null ? "" : element.posterPath!);
        });
      }
    } else {
      validate.value = true;
      movieTitleList.clear();
      movieImageList.clear();
    }
    // searchCircular kapatılır
    searchCircular.value = false;
  }
}
